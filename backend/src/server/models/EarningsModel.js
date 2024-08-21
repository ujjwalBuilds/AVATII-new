import { Schema, model } from "mongoose";

const earningSchema = new Schema({
    userId:{
        type:String,
        isRequired:true
    },
    todayEarning:{
        type:[String]
    },
    ridesNumber:{
        type:Number,
    },
    
}, { timestamps: true });

const Earning = model("Earning", earningSchema);

export default Earning;