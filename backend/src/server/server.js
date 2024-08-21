// Import necessary modules
import express, { json } from "express";
import connectDb from "./config/dbconnection.js";
import cors from "cors";
import uploadKeRoutes from './routes/uploadRoutes.js';
import userKeRoutes from './routes/UserRoutes.js';
import {FRONTEND_URL} from "./constants.js"

// Connect to MongoDB
connectDb();

// Initialize Express app
const app = express();
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
app.get("/",(req,res)=>{
  res.send("server is working");
})


app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});