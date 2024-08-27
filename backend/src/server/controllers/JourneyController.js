import asyncHandler from "express-async-handler";
import Journey from "../models/JourneyModel.js";
import dotenv from "dotenv";
import Cost from "../models/CostingModel.js";
import Driver from "../models/DriverModel.js";
import axios from "axios";

dotenv.config();

export const StartJourney = asyncHandler(async (req, res) => {
    try {
        const { passengerId, driverId, pickOff, dropOff, distance } = req.body;

        // Validate required fields
        if (!passengerId || !driverId || !pickOff || !dropOff || !distance) {
            return res.status(400).json({ message: "Bad request: Missing required fields" });
        }

        // Generate a 6-digit OTP
        const otp = Math.floor(100000 + Math.random() * 900000);

        // Find the driver by ID
        const driver = await Driver.findById(driverId);
        if (!driver) {
            return res.status(404).json({ message: "Driver not found" });
        }
        // Fetch costing details from external API
        let fare;
        try {
            const cost = await Cost.find({VehicleType:driver.vehicle.Type});
            const InitialCost = cost[0].InitialCost;
            const CostPerKilometre = cost[0].CostPerKilometre;
            fare = InitialCost;
            if (distance > 2) {
                fare += CostPerKilometre * (distance - 2);
            }
        } catch (error) {
            return res.status(500).json({ message: `Failed to fetch costing: ${error.message}` });
        }

        // Create a new journey record
        const startedJourney = new Journey({
            passengerId,
            driverId,
            pickOff,
            dropOff,
            distance:fare,
            otp,
            status: "ACTIVE"
        });

        // Save the journey to the database
        await startedJourney.save();

        return res.status(201).json({ message: "Journey created successfully", journeyId: startedJourney._id });
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }
});

export const ValidateOTP = asyncHandler(async (req, res) => {
    try {
        const { journeyId, otp } = req.body;

        if (!journeyId || !otp) {
            return res.status(400).json({ message: "Bad request" });
        }

        const journey = await Journey.findById(journeyId);

        if (!journey) {
            return res.status(404).json({ message: "Journey not found" });
        }

        if (journey.otp !== otp) {
            return res.status(400).json({ message: "Invalid OTP" });
        }
        return res.status(200).json({ message: "OTP validated successfully" });
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }
});

export const EndJourney = asyncHandler(async (req, res) => {
    try {
        const { journeyId } = req.body;

        if (!journeyId) {
            return res.status(400).json({ message: "Bad request" });
        }

        const journey = await Journey.findById(journeyId);

        if (!journey) {
            return res.status(404).json({ message: "Journey not found" });
        }

        if (journey.status === "COMPLETED") {
            return res.status(400).json({ message: "Journey is already completed" });
        }

        journey.status = "COMPLETED";
        await journey.save();

        return res.status(200).json({ message: "Journey ended successfully", journey });
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }

    
});

export const CancelJourney = asyncHandler(async (req, res) => {
    try {
        const { journeyId } = req.body;

        if (!journeyId) {
            return res.status(400).json({ message: "Bad request" });
        }

        const journey = await Journey.findById(journeyId);

        if (!journey) {
            return res.status(404).json({ message: "Journey not found" });
        }

        if (journey.status === "CANCELLED") {
            return res.status(400).json({ message: "Journey is already cancelled" });
        }

        journey.status = "CANCELLED";
        await journey.save();

        return res.status(200).json({ message: "Journey cancelled successfully", journey });
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }
});

export const GetAllJourneys = asyncHandler(async (req, res) => {
    try {
        const journeys = await Journey.find();

        if (journeys.length === 0) {
            return res.status(404).json({ message: "No journeys found" });
        }

        return res.status(200).json({ message: "Journeys retrieved successfully", journeys });
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }
});

export const GetJourneyInfoById = asyncHandler(async (req, res) => {
    try {
        const { journeyId } = req.params;

        if (!journeyId) {
            return res.status(400).json({ message: "Bad request" });
        }

        const journey = await Journey.findById(journeyId);

        if (!journey) {
            return res.status(404).json({ message: "Journey not found" });
        }

        return res.status(200).json(journey);
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }
});

export const getCosting = asyncHandler(async (req, res) => {
    try {
        const {VehicleType} = req.query;

        if (!VehicleType) {
            return res.status(400).json({ message: "Bad request" });
        }

        const cost = await Cost.find({VehicleType});

        if (!cost) {
            return res.status(404).json({ message: "costing not found" });
        }

        return res.status(200).json(cost);
    } catch (err) {
        return res.status(500).json({ message: `Internal Server Error: ${err.message}` });
    }
});