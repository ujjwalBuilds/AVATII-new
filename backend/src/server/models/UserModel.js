import { Schema, model } from "mongoose";

const userSchema = new Schema({
    name:{
        type:String
    },
    phoneNumebr:{
        type:String
    }
}, { timestamps: true });

const User = model("User", userSchema);

export default User;
