import { Schema, model } from "mongoose";

const costSchema = new Schema({
    VehicleType:{
        type:String,
        enum:["CAR","AUTO","BIKE"]
    },
    InitialCost:{
        type:String,
    },
    CostPerKilometre:{
        type:String,
    }
}, { timestamps: true });

const Cost = model("Cost", costSchema);

export default Cost;
