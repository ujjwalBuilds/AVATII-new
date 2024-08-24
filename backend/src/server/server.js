// Import necessary modules
import express, { json } from "express";
import connectDb from "./config/dbconnection.js";
import cors from "cors";
import uploadKeRoutes from './routes/uploadRoutes.js';
import userKeRoutes from './routes/UserRoutes.js';
import jouneyRoutes from "./routes/JourneyRoutes.js"
import { Server } from "socket.io";
import http from "http";

// Connect to MongoDB
connectDb();

// Initialize Express app
const app = express();

const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*", // Allow requests from any origin
    methods: ["GET", "POST"]
  }
});

const port = process.env.PORT || 3002;

// Set up JSON middleware
app.use(json());
app.use(express.urlencoded({ extended: true }));


// Enable CORS
app.use(
  cors({
    origin: `*`,
    methods: ["GET", "POST", "PUT", "DELETE"],
    credentials: true,
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);

app.use("/api/image",uploadKeRoutes);
app.use("/api/user",userKeRoutes);
app.use("/api/booking",jouneyRoutes);
app.get("/",(req,res)=>{
  res.send("server is working");
})

const drivers = new Map(); // To store connected drivers and their locations
const activeRequests = new Map(); // To store active ride requests

// When a client connects
io.on("connection", (socket) => {
  console.log(`User connected: ${socket.id}`);

  // Driver joins the platform and is available for requests
  socket.on("driverJoin", ({ driverId }) => {
    console.log(`Driver ${driverId} is available`);
    drivers.set(driverId, { socketId: socket.id, available: true });
  });

  // Listen for a passenger ride request
  socket.on("requestRide", ({ passengerId, pickOff, dropOff }) => {
    console.log(`Passenger ${passengerId} requested a ride from ${pickOff} to ${dropOff}`);

    // Store the request temporarily
    const requestId = `request-${Date.now()}`; // Generate a unique request ID
    activeRequests.set(requestId, { passengerId, pickOff, dropOff });

    // Emit the ride request to all available drivers
    for (let [driverId, driverData] of drivers) {
      if (driverData.available) {
        io.to(driverData.socketId).emit("rideRequest", { requestId, passengerId, pickOff, dropOff });
      }
    }
  });

  // Listen for a driver accepting the ride request
  socket.on("acceptRide", async ({ requestId, driverId }) => {
    const request = activeRequests.get(requestId);
    if (request) {
      console.log(`Driver ${driverId} accepted the ride request ${requestId}`);

      // Remove the request from active requests
      activeRequests.delete(requestId);

      // Set driver as unavailable
      drivers.get(driverId).available = false;

      // Send accepted details to the backend and create a new journey
      const journeyDetails = {
        passengerId: request.passengerId,
        driverId,
        pickOff: request.pickOff,
        dropOff: request.dropOff,
      };

      // Assume `createJourney` is a function that sends data to your backend to create a journey
      const journeyId = await createJourney(journeyDetails);

      // Notify the passenger that a driver has been assigned
      io.to(socket.id).emit("rideAccepted", { journeyId, driverId, ...journeyDetails });

      // Join the driver to the journey room
      socket.join(journeyId);

      // Also notify the passenger to join the same room
      io.to(drivers.get(driverId).socketId).emit("joinJourney", { journeyId, driverId });

      console.log(`Journey ${journeyId} started with driver ${driverId} and passenger ${request.passengerId}`);
    } else {
      console.log(`Ride request ${requestId} is no longer available`);
      socket.emit("rideUnavailable", { requestId });
    }
  });

  // Listen for driver location updates
  socket.on("updateLocation", ({ driverId, location }) => {
    const driver = drivers.get(driverId);
    if (driver && !driver.available) {
      // Emit the updated location to all clients in the journey room
      io.to(driver.journeyId).emit("locationUpdate", { driverId, location });
      console.log(`Driver ${driverId} location updated:`, location);
    }
  });

  // Listen for disconnection
  socket.on("disconnect", () => {
    console.log(`User disconnected: ${socket.id}`);
    for (let [driverId, driverData] of drivers) {
      if (driverData.socketId === socket.id) {
        drivers.delete(driverId);
        console.log(`Driver ${driverId} has been removed`);
        break;
      }
    }
  });
});

async function createJourney(journeyDetails) {
  try {
    // Make a POST request to the specified URL with journey details
    const response = await axios.post('https://avatii-new.onrender.com/api/booking/start', journeyDetails);
    
    // Return the journey ID from the response
    return response.data.journeyId;
  } catch (error) {
    console.error('Error creating journey:', error);
    // Handle errors accordingly, e.g., return an error message or throw an exception
    throw error;
  }
}


server.listen(port,() => {
  console.log(`Server is running on port ${port}`);
});