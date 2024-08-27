import { Schema, model } from "mongoose";

const DriverSchema = new Schema({
    name: String,
    city: String,
    age: Number,
    PhoneNumber: { type: String, required: true, unique: true },
    vehicle: {
        Type:{
            type:String,
            enum:["Car","Auto","Bike"],
        },
        RcImage: String,
        RegistrationNumber: { type: String, unique: true }
    },
    drivingLicense: {
        LicenseNumber: { type: String, unique: true },
        Image: String,
    },
    profileUrl: String,
    status: { type: Boolean, default: false },
    approved: { type: Number, default: 0 }
}, { timestamps: true });

const Driver = model("Driver", DriverSchema);

export default Driver;
