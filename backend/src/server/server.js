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

// Store the connected drivers and their locations
const drivers = new Map();

// When a client connects
io.on("connection", (socket) => {
  console.log(`User connected: ${socket.id}`);

  // Listen for driver joining a journey
  socket.on("joinJourney", ({ journeyId, driverId }) => {
    console.log(`Driver ${driverId} joined journey ${journeyId}`);
    drivers.set(driverId, { journeyId, location: null });
    socket.join(journeyId); // Join the driver to a room based on the journeyId
  });

  // Listen for driver location updates

  socket.on("updateLocation", ({ driverId, location }) => {
    const driver = drivers.get(driverId);
    if (driver) {
      driver.location = location;

      // Emit the updated location to all clients in the journey room
      io.to(driver.journeyId).emit("locationUpdate", {
        driverId,
        location
      });

      console.log(`Driver ${driverId} location updated:`, location);
    }
  });


 // Listen for ride requests
 socket.on("requestRide", ({ userId, currentLocation, destinationLocation }) => {
  // console.log(`User ${userId} requested a ride from ${currentLocation} to ${destinationLocation}`);

  // // Notify all drivers (for simplicity, you could filter drivers based on proximity)
  // io.emit("rideRequest", {
  //   userId,
  //   currentLocation,
  //   destinationLocation,
  console.log(`Passenger ${userId} requested a ride from ${currentLocation} to ${destinationLocation}`);

    // Store the request temporarily
    const requestId = `request-${Date.now()}`; // Generate a unique request ID
    activeRequests.set(requestId, {userId, currentLocation, destinationLocation });

    // Emit the ride request to all available drivers
    for (let [userId, driverData] of drivers) {
      if (driverData.available) {
        io.to(driverData.socketId).emit("rideRequest", { requestId, userId, currentLocation, destinationLocation });
      }
    }// });




});

socket.on("acceptRide", ({ driverId, userId, journeyId }) => {
  console.log(`Driver ${driverId} accepted ride request for user ${userId}`);

  // Notify the user that their ride was accepted
  io.to(userId).emit("rideAccepted", {

    driverId,
    journeyId,
  });
});



  // Listen for disconnection
  socket.on("disconnect", () => {
    console.log(`User disconnected: ${socket.id}`);
    // You can remove the driver from the map or handle other cleanup if needed
  });
});

server.listen(port,() => {
  console.log(`Server is running on port ${port}`);
});