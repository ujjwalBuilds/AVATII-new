import { Router } from "express";
import {
  RegisterDriver,
  LoginDriver,
  getUsers,
  getUserById,
  updateDriver,
  deleteDriver,
  ValidateDriver,
  ChangeDriverStatus
} from "../controllers/DriverController.js";

const router = Router();

// Route for registering a new driver
router.post("/register", RegisterDriver);

// Route for logging in a driver using PhoneNumber
router.post("/login", LoginDriver);

// Route for getting all drivers
router.get("/drivers", getUsers);

// Route for getting a driver by ID
router.get("/driver/:id", getUserById);

// Route for updating a driver by ID
router.put("/driver/:id", updateDriver);

// Route for deleting a driver by ID
router.delete("/driver/:id", deleteDriver);

// Route for approving a driver by ID (Validation)
router.post("/driver/validate", ValidateDriver);

// Route for changing the status of a driver by ID
router.post("/driver/status", ChangeDriverStatus);

export default router;
