// // Import necessary modules
// import express, { json } from "express";
// import connectDb from "./config/dbconnection.js";
// import cors from "cors";
// import uploadKeRoutes from './routes/uploadRoutes.js';
// import userKeRoutes from './routes/UserRoutes.js';
// import jouneyRoutes from "./routes/JourneyRoutes.js"
// import { Server } from "socket.io";
// import http from "http";

// // Connect to MongoDB


// connectDb();

// // Initialize Express app
// const app = express();

// const server = http.createServer(app);
// const io = new Server(server, {
//   cors: {
//     origin: "*", // Allow requests from any origin
//     methods: ["GET", "POST"]
//   }
// });

// const port = process.env.PORT || 3002;

// // Set up JSON middleware
// app.use(json());
// app.use(express.urlencoded({ extended: true }));


// // Enable CORS
// app.use(
//   cors({
//     origin: `*`,
//     methods: ["GET", "POST", "PUT", "DELETE"],
//     credentials: true,
//     allowedHeaders: ["Content-Type", "Authorization"],
//   })
// );

// app.use("/api/image",uploadKeRoutes);
// app.use("/api/user",userKeRoutes);
// app.use("/api/booking",jouneyRoutes);
// app.get("/",(req,res)=>{
//   res.send("server is working");
// })

// // Store the connected drivers and their locations
// const drivers = new Map();

// // When a client connects
// io.on("connection", (socket) => {
//   console.log(`User connected: ${socket.id}`);

//   // Listen for driver joining a journey
//   socket.on("joinJourney", ({ journeyId, driverId }) => {
//     console.log(`Driver ${driverId} joined journey ${journeyId}`);
//     drivers.set(driverId, { journeyId, location: null });
//     socket.join(journeyId); // Join the driver to a room based on the journeyId
//   });

//   // Listen for driver location updates

//   socket.on("updateLocation", ({ driverId, location }) => {
//     const driver = drivers.get(driverId);
//     if (driver) {
//       driver.location = location;

//       // Emit the updated location to all clients in the journey room
//       io.to(driver.journeyId).emit("locationUpdate", {
//         driverId,
//         location
//       });

//       console.log(`Driver ${driverId} location updated:`, location);
//     }
//   });


//  // Listen for ride requests
//  socket.on("requestRide", ({ userId, currentLocation, destinationLocation }) => {
//   // console.log(`User ${userId} requested a ride from ${currentLocation} to ${destinationLocation}`);

//   // // Notify all drivers (for simplicity, you could filter drivers based on proximity)
//   // io.emit("rideRequest", {
//   //   userId,
//   //   currentLocation,
//   //   destinationLocation,
//   console.log(`Passenger ${userId} requested a ride from ${currentLocation} to ${destinationLocation}`);

//     // Store the request temporarily
//     const requestId = `request-${Date.now()}`; // Generate a unique request ID
//     activeRequests.set(requestId, {userId, currentLocation, destinationLocation });

//     // Emit the ride request to all available drivers
//     for (let [userId, driverData] of drivers) {
//       if (driverData.available) {
//         io.to(driverData.socketId).emit("rideRequest", { requestId, userId, currentLocation, destinationLocation });
//       }
//     }// });




// });

// socket.on("acceptRide", ({ driverId, userId, journeyId }) => {
//   console.log(`Driver ${driverId} accepted ride request for user ${userId}`);

//   // Notify the user that their ride was accepted
//   io.to(userId).emit("rideAccepted", {

//     driverId,
//     journeyId,
//   });
// });



//   // Listen for disconnection
//   socket.on("disconnect", () => {
//     console.log(`User disconnected: ${socket.id}`);
//     // You can remove the driver from the map or handle other cleanup if needed
//   });
// });

// server.listen(port,() => {
//   console.log(`Server is running on port ${port}`);
// });






// import express, { json } from "express";
// import connectDb from "./config/dbconnection.js";
// import cors from "cors";
// import uploadKeRoutes from './routes/uploadRoutes.js';
// import userKeRoutes from './routes/UserRoutes.js';
// import jouneyRoutes from "./routes/JourneyRoutes.js";
// import { Server } from "socket.io";
// import http from "http";
// import axios from "axios";
// import AdminJS from 'adminjs';
// import AdminJSExpress from '@adminjs/express';
// import { Database, Resource } from '@adminjs/mongoose';
// import User from './models/UserModel.js';
// import Journey from './models/JourneyModel.js';
// import Driver from './models/DriverModel.js';

// // Connect to MongoDB
// connectDb();

// // Initialize AdminJS
// AdminJS.registerAdapter({ Database, Resource });

// const adminJs = new AdminJS({
//   resources: [
//     { resource: User },
//     { resource: Journey },
//     { resource: Driver },
//   ],
//   rootPath: '/admin',
// });

// const adminRouter = AdminJSExpress.buildRouter(adminJs);

// // Initialize Express app
// const app = express();
// const server = http.createServer(app);
// const io = new Server(server, {
//   cors: {
//     origin: "*",
//     methods: ["GET", "POST"]
//   }
// });

// const port = process.env.PORT || 3002;

// // Set up JSON middleware
// app.use(json());
// app.use(express.urlencoded({ extended: true }));

// // Enable CORS
// app.use(cors({
//   origin: '*',
//   methods: ["GET", "POST", "PUT", "DELETE"],
//   credentials: true,
//   allowedHeaders: ["Content-Type", "Authorization"],
// }));

// // Add AdminJS router
// app.use(adminJs.options.rootPath, adminRouter);

// app.use("/api/image", uploadKeRoutes);
// app.use("/api/user", userKeRoutes);
// app.use("/api/booking", jouneyRoutes);
// app.get("/", (req, res) => {
//   res.send("server is working");
// });

// // Store the connected drivers and their details
// const drivers = new Map(); // Stores driver socket IDs and details
// const users = new Map(); // Stores user socket IDs
// const activeRequests = new Map();

// // When a client connects
// io.on("connection", (socket) => {
//   console.log(`User connected: ${socket.id}`);

//   // Handle user connection
//   socket.on("userConnect", ({ userId }) => {
//     console.log(`User ${userId} connected with socket ID ${socket.id}`);
//     users.set(userId, socket.id);
//   });

//   // Handle driver connection
//   socket.on("driverConnect", ({ driverId }) => {
//     console.log(`Driver ${driverId} connected with socket ID ${socket.id}`);
//     drivers.set(driverId, { socketId: socket.id, available: true });
//   });

//   // Handle driver joining a journey
//   socket.on("joinJourney", ({ journeyId, driverId }) => {
//     console.log(`Driver ${driverId} joined journey ${journeyId}`);
//     const driver = drivers.get(driverId);
//     if (driver) {
//       driver.journeyId = journeyId;
//       socket.join(journeyId);
//     }
//   });

//   // Handle driver location updates
//   socket.on("updateLocation", ({ driverId, location }) => {
//     const driver = drivers.get(driverId);
//     if (driver) {
//       driver.location = location;
//       io.to(driver.journeyId).emit("locationUpdate", {
//         driverId,
//         location
//       });
//       console.log(`Driver ${driverId} location updated:`, location);
//     }
//   });

//   // Handle ride requests
//   socket.on("requestRide", ({ userId, currentLocation, destinationLocation }) => {
//     console.log(`Passenger ${userId} requested a ride from ${currentLocation} to ${destinationLocation}`);

//     // Store the request temporarily
//     const requestId = `request-${Date.now()}`;
//     activeRequests.set(requestId, { userId, currentLocation, destinationLocation });
//     // activeRequests.set(requestId, {userId, currentLocation,destinationLocation});

//     // Notify all available drivers
//     for (let [driverData] of drivers) {
//       if (driverData.available) {
//         io.to(driverData.socketId).emit("rideRequest", {
//           requestId,
//           userId,
//           currentLocation,
//           destinationLocation,
//           userSocketId: users.get(userId) // Emit user's socket ID to drivers
//         });
//       }
//     }
//   });
// // Handle a driver accepting a ride request

// socket.on("acceptRide", ({ driverId, userId, journeyId }) => {
//   console.log(`Driver ${driverId} accepted ride request for user ${userId}`);

//   // Notify the user that their ride was accepted
//   io.to(userId).emit("rideAccepted", {
//     driverId,
//     journeyId,
//   });
// });



//   // Listen for disconnection
//   socket.on("disconnect", () => {
//     console.log(`User disconnected: ${socket.id}`);
//     // Cleanup user and driver data on disconnect
//     drivers.forEach((driver, driverId) => {
//       if (driver.socketId === socket.id) {
//         drivers.delete(driverId);
//       }
//     });
//     users.forEach((socketId, userId) => {
//       if (socketId === socket.id) {
//         users.delete(userId);
//       }
//     });
//   });
// });

// server.listen(port, () => {
//   console.log(`Server is running on port ${port}`);
// });




import express, { json } from "express";
import connectDb from "./config/dbconnection.js";
import cors from "cors";
import uploadKeRoutes from './routes/uploadRoutes.js';
import userKeRoutes from './routes/UserRoutes.js';
import jouneyRoutes from "./routes/JourneyRoutes.js";
import { Server } from "socket.io";
import http from "http";
import axios from "axios";
import AdminJS from 'adminjs';
import AdminJSExpress from '@adminjs/express';
import { Database, Resource } from '@adminjs/mongoose';
import User from './models/UserModel.js';
import Journey from './models/JourneyModel.js';
import Driver from './models/DriverModel.js';

// Connect to MongoDB
connectDb();
// Initialize AdminJS
AdminJS.registerAdapter({ Database, Resource });

const adminJs = new AdminJS({
  resources: [
    { resource: User },
    { resource: Journey },
    { resource: Driver },
  ],
  rootPath: '/admin',
});

const adminRouter = AdminJSExpress.buildRouter(adminJs);


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
app.use(cors({
  origin: '*',
  methods: ["GET", "POST", "PUT", "DELETE"],
  credentials: true,
  allowedHeaders: ["Content-Type", "Authorization"],
}));

app.use("/api/image", uploadKeRoutes);
app.use("/api/user", userKeRoutes);
app.use("/api/booking", jouneyRoutes);
app.get("/", (req, res) => {
  res.send("server is working");
});

// Store the connected drivers and their details
const drivers = new Map(); // Stores driver socket IDs and details
const users = new Map(); // Stores user socket IDs
const activeRequests = new Map();

// When a client connects
io.on("connection", (socket) => {
  console.log(`User connected: ${socket.id}`);

  // Handle user connection
  socket.on("userConnect", ({ userId }) => {
    console.log(`User ${userId} connected with socket ID ${socket.id}`);
    users.set(userId, socket.id);
  });

  // Handle driver connection
  socket.on("driverConnect", ({ driverId }) => {
    console.log(`Driver ${driverId} connected with socket ID ${socket.id}`);
    drivers.set(driverId, { socketId: socket.id, available: true });
  });

  // Handle driver joining a journey
  socket.on("joinJourney", ({ journeyId, driverId }) => {
    console.log(`Driver ${driverId} joined journey ${journeyId}`);
    const driver = drivers.get(driverId);
    if (driver) {
      driver.journeyId = journeyId;
      socket.join(journeyId);
    }
  });

  // Handle driver location updates
  // socket.on("updateLocation", ({ driverId, location }) => {
  //   const driver = drivers.get(driverId);
  //   if (driver) {
  //     driver.location = location;
  //     io.to(driver.journeyId).emit("locationUpdate", {
  //       driverId,
  //       location
  //     });
  //     console.log(`Driver ${driverId} location updated:`, location);
  //   }
  // });
  socket.on("updateLocation", ({ driverId, location }) => {
    const driver = drivers.get(driverId);
    if (driver) {
      driver.location = location;
  
      // Emit the updated location to all clients in the same journey room
      io.to(driver.journeyId).emit("locationUpdate", {
        driverId,
        location
      });
  
      console.log(`Driver ${driverId} location updated:`, location);
    }
  });
  // Handle ride requests
  socket.on("requestRide", ({ userId, currentLocation, destinationLocation }) => {
    console.log(`Passenger ${userId} requested a ride from ${currentLocation} to ${destinationLocation}`);

    // Store the request temporarily
    const requestId = `request-${Date.now()}`;
    activeRequests.set(requestId, { userId, currentLocation, destinationLocation });

    // Notify all available drivers
    for (let [driverId, driverData] of drivers) {
      if (driverData.available) {
        io.to(driverData.socketId).emit("rideRequest", {
          requestId,
          userId,
          currentLocation,
          destinationLocation,
          userSocketId: users.get(userId) // Emit user's socket ID to drivers
        });
      }
    }
  });

  // Handle a driver accepting a ride request
 // Handle a driver accepting a ride request


socket.on("acceptRide", async ({ requestId, driverId }) => {
  const request = activeRequests.get(requestId);
  if (request) {
    console.log(`Driver ${driverId} accepted the ride request.......... ${requestId}`);

    // Remove the request from active requests
    activeRequests.delete(requestId);

    // Mark driver as unavailable
    const driver = drivers.get(driverId);
    if (driver) {
      driver.available = false;
    }

    // Create a journey
    const journeyDetails = {
      passengerId: request.userId,
      driverId,
      pickOff: request.currentLocation,
      dropOff: request.destinationLocation,
    };

    try {
      console.log("rekha meri jaan");
      console.log(journeyDetails);
      const { data } = await axios.post('https://avatii-backend.onrender.com/api/booking/start', journeyDetails);
      const journeyId = data.journeyId;

      // Notify the passenger
      const userSocketId = users.get(request.userId);
      if (userSocketId) {
        io.to(userSocketId).emit("rideAccepted", { journeyId, driverId, ...journeyDetails });
        // Join the user to the journey room
        socket.to(userSocketId).join(journeyId);
      } else {
        console.log(`Socket ID for user ${request.userId} not found.....`);
      }

      // Notify the driver to join the same room
      // const driverSocketId = driver.socketId;
      // if (driverSocketId) {
      //   io.to(driverSocketId).emit("joinJourney", { journeyId, driverId });
      //   // Join the driver to the journey room
      //   socket.to(driverSocketId).join(journeyId);
      // } else {
      //   console.log(`Socket ID for driver ${driverId} not found`);
      // }
 // Notify the driver to start the journey
            const driverSocketId = driver.socketId;
            if (driverSocketId) {
              io.to(driverSocketId).emit("startJourney", { 
                journeyId, 
                driverId, 
                pickOff: request.currentLocation 
              });
              // Join the driver to the journey room
              socket.to(driverSocketId).join(journeyId);
            } else {
              console.log(`Socket ID for driver ${driverId} not found`);
            }




      console.log(`Journey ${journeyId} started with driver ${driverId} and passenger ${request.userId}`);
    } catch (error) {
      console.error('Error creating journey:', error);
      socket.emit("rideError", { message: "Error creating journey" });
    }
  } else {
    console.log(`Ride request ${requestId} is no longer available`);
    socket.emit("rideUnavailable", { requestId });
  }
});

  // Handle disconnection
  socket.on("disconnect", () => {
    console.log(`User disconnected: ${socket.id}`);
    // Cleanup user and driver data on disconnect
    drivers.forEach((driver, driverId) => {
      if (driver.socketId === socket.id) {
        drivers.delete(driverId);
      }
    });
    users.forEach((socketId, userId) => {
      if (socketId === socket.id) {
        users.delete(userId);
      }
    });
  });
});

server.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
