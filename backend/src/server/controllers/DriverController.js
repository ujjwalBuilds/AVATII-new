import asyncHandler from "express-async-handler";
import Driver from "../models/DriverModel.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

export const RegisterDriver = asyncHandler(async (req, res) => {
  try {
    const {
      name,
      city,
      age,
      PhoneNumber,
      vehicle,
      drivingLicense,
      profileUrl,
    } = req.body;

    if (
      !name ||
      !city ||
      !age ||
      !PhoneNumber ||
      !vehicle ||
      !drivingLicense ||
      !profileUrl
    ) {
      return res
        .status(400)
        .json({ message: "Bad Request: Missing required fields" });
    }

    const existingDriver = await Driver.findOne({
      $or: [
        { PhoneNumber },
        { "drivingLicense.LicenseNumber": drivingLicense.LicenseNumber },
        { "vehicle.RegistrationNumber": vehicle.RegistrationNumber },
      ],
    });

    if (existingDriver) {
      return res.status(400).json({
        message:
          "Driver with this phone number, license, or vehicle registration already exists",
      });
    }

    const driver = new Driver({
      name,
      city,
      age,
      PhoneNumber,
      vehicle,
      drivingLicense,
      profileUrl,
      status: false,
      approved: 0,
    });

    const createdDriver = await driver.save();

    // Generate JWT Token
    const token = jwt.sign({ id: createdDriver._id }, process.env.JWT_SECRET, {
      expiresIn: "30d",
    });

    return res.status(201).json({
      _id: createdDriver._id,
      name: createdDriver.name,
      PhoneNumber: createdDriver.PhoneNumber,
      token,
      approved: driver.approved
    });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server error ${err}` });
  }
});

export const LoginDriver = asyncHandler(async (req, res) => {
  try {
    const { PhoneNumber } = req.body;

    if (!PhoneNumber) {
      return res.status(400).json({ message: "Phone Number is missing" });
    }

    const driver = await Driver.findOne({ PhoneNumber });

    if (!driver) {
      return res.status(404).json({ message: "Driver not found" });
    }

    const token = jwt.sign({ id: driver._id }, process.env.JWT_SECRET, {
      expiresIn: "30d",
    });

    return res.status(200).json({
      _id: driver._id,
      name: driver.name,
      PhoneNumber: driver.PhoneNumber,
      token,
      approved: driver.approved
    });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server error ${err}`});
  }
});

export const getUsers = asyncHandler(async (req, res) => {
  try {

    const drivers = await Driver.find({});

    if (!drivers) {
      return res.status(404).json({ message: "Drivers not found" });
    }
    return res.status(200).json({ message: "Drivers fetched succesfully" });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server error ${err}` });
  }
});

export const getUserById = asyncHandler(async (req, res) => {
    try {
      const { id } = req.params;
      const driver = await Driver.findById(id);
  
      if (!driver) {
        return res.status(404).json({ message: "Driver not found" });
      }
  
      return res.status(200).json(driver);
    } catch (err) {
      return res.status(500).json({ message: `Internal Server error: ${err}` });
    }
});

export const updateDriver = asyncHandler(async (req, res) => {
    try {
      const { id } = req.params;
      const updates = req.body;
  
      const driver = await Driver.findById(id);
  
      if (!driver) {
        return res.status(404).json({ message: "Driver not found" });
      }
  
      // Update the driver's details
      Object.keys(updates).forEach(key => {
        driver[key] = updates[key];
      });
  
      const updatedDriver = await driver.save();
  
      return res.status(200).json(updatedDriver);
    } catch (err) {
      return res.status(500).json({ message: `Internal Server error: ${err}` });
    }
});

export const deleteDriver = asyncHandler(async (req, res) => {
    try {
      const { id } = req.params;
      const driver = await Driver.findById(id);
  
      if (!driver) {
        return res.status(404).json({ message: "Driver not found" });
      }
  
      await driver.remove();
  
      return res.status(200).json({ message: "Driver deleted successfully" });
    } catch (err) {
      return res.status(500).json({ message: `Internal Server error: ${err}` });
    }
});

export const ValidateDriver = asyncHandler(async (req, res) => {
  try {
    const { id } = req.body;

    if (!id) {
      return res.status(400).json({ message: "Phone Number is missing" });
    }

    const driver = await Driver.findOne({ _id: id });

    if (!driver) {
      return res.status(404).json({ message: "Driver not found" });
    }

    driver.approved = 1;
    await driver.save();
    return res.status(200).json({ message: "Driver approved succesfully" });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server error ${err}` });
  }
});

export const ChangeDriverStatus = asyncHandler(async (req, res) => {
  try {
    const { id } = req.body;

    if (!id) {
      return res.status(400).json({ message: "Phone Number is missing" });
    }

    const driver = await Driver.findOne({ _id: id });

    if (!driver) {
      return res.status(404).json({ message: "Driver not found" });
    }

    driver.status = true;
    await driver.save();
    return res.status(200).json({ message: "Driver approved succesfully" });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server error ${err}` });
  }
});
