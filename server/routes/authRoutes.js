import express  from 'express';
import bycryptjs from 'bcryptjs';
import userModel from '../model/user.js';


const authRoute = express.Router();



//sign up

authRoute.post('/api/signup',async(req,res)=>{


    try{

        const { name , email , password }  = req.body;



        const userExist = await userModel.findOne({
            email
        });
    
    
    
    
    
        if(userExist){
           return  res.status(400).json({
                message: "User with same email"
            })
        }

        const hashPassword = await bycryptjs.hash(password,8)
    
        let newUser = new userModel({
            email,
            password : hashPassword,
            name,
        })
    
        newUser =  await newUser.save();
    
    
        res.json({
            user: newUser,
            message: 'Create account scuccess'
        })
    
    
     

    }catch(e){


        res.status(500).json(
            {
                message: e.message
            }
        )

    }




});


export default  authRoute;