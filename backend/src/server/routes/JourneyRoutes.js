import express from "express";
import {
    StartJourney,
    ValidateOTP,
    EndJourney,
    CancelJourney,
    GetAllJourneys,
    GetJourneyInfoById
} from "../controllers/JourneyController.js";

const router = express.Router();


router.post("/start", StartJourney);
router.post("/validate-otp", ValidateOTP);
router.post("/end", EndJourney);
router.post("/cancel", CancelJourney);

router.get("/all", GetAllJourneys);
router.get("/:journeyId", GetJourneyInfoById);

export default router;
