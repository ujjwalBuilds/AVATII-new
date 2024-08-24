import asyncHandler from "express-async-handler";
import User from "../models/UserModel.js";
import jwt from "jsonwebtoken";
import dotenv from "dotenv";

dotenv.config();

// Register User
export const registerUser = asyncHandler(async (req, res) => {
  try {
    const { name, phoneNumber } = req.body;

    if (!name || !phoneNumber) {
      return res
        .status(400)
        .json({ message: "Bad Request: Missing required fields" });
    }

    const existingUser = await User.findOne({ phoneNumber });

    if (existingUser) {
      return res.status(400).json({
        message: "User with this phone number already exists",
      });
    }

    const user = new User({
      name,
      phoneNumber,
    });

    const createdUser = await user.save();

    // Generate JWT Token
    const token = jwt.sign({ id: createdUser._id }, process.env.JWT_SECRET, {
      expiresIn: "30d",
    });

    return res.status(201).json({
      _id: createdUser._id,
      name: createdUser.name,
      phoneNumber: createdUser.phoneNumber,
      token,
    });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
  }
});

// Login User
export const loginUser = asyncHandler(async (req, res) => {
  try {
    const { phoneNumber } = req.body;

    if (!phoneNumber) {
      return res.status(400).json({ message: "Phone Number is required" });
    }

    const user = await User.findOne({ phoneNumber });

    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, {
      expiresIn: "30d",
    });

    return res.status(200).json({
      _id: user._id,
      name: user.name,
      phoneNumber: user.phoneNumber,
      token,
    });
  } catch (err) {
    return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
  }
});
