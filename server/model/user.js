import mongoose, { Types } from 'mongoose';


const userSchema = mongoose.Schema({
    name:{
        type: String,
        required:true,
        trim:true,
    },
    email:{
        type: String,
        required:true,
        trim:true,
        validate:{
            validator:(value) => {
                const re = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                return value.match(re);
            },
            message: 'please enter valid mail'
        },
    },
    password:{
        type: String,
        required:true,
        
    },

    address:{
        type: String,
        default:'',
        
    },
    type: {
        type: String,
        default: 'user',
    }





})

const  userModel = mongoose.model("user", userSchema)


export default userModel;