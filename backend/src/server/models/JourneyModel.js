import { Schema, model } from "mongoose";

const journeySchema = new Schema({
    passengerId:{
        type:String,
    },
    driverId:{
        type:String
    }
}, { timestamps: true });

const Journey = model("Journey", journeySchema);

export default Journey;