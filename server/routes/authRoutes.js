import express from "express";
import bycryptjs from "bcryptjs";
import userModel from "../model/user.js";
import jwt from "jsonwebtoken";
import authMiddle from "../middlewares/authMiddleWare.js";

const authRoute = express.Router();

//sign up

authRoute.post("/api/signup", async (req, res) => {
  try {
    console.log(req.body);

    const { name, email, password } = req.body;

    console.log(req.body);

    const userExist = await userModel.findOne({
      email,
    });

    if (userExist) {
      return res.status(400).json({
        message: "User with same email",
      });
    }

    const hashPassword = await bycryptjs.hash(password, 8);

    let newUser = new userModel({
      email,
      password: hashPassword,
      name,
    });

    newUser = await newUser.save();

    res.json({
      user: newUser,
      message: "Create account scuccess",
    });
  } catch (e) {
    res.status(500).json({
      message: e.message,
    });
  }
});

//login
authRoute.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await userModel.findOne({ email });

    if (!user) {
      return res.status(400).json({
        message: "User not exist this email",
      });
    }

    const isMatch = await bycryptjs.compare(password, user.password);

    if (!isMatch) {
      return res.status(400).json({
        message: "Password incorrect",
      });
    }

    const token = jwt.sign({ userId: user._id }, "qwertyuiop");

    res.json({
      ...user._doc,

      token,
      message: "Login Success",
    });
  } catch (e) {
    res.status(500).json({
      message: e.message,
    });
  }
});

authRoute.post("/api/varifyToken", async (req, res) => {
  try {
    const token = req.header("x-auth-token");

    if (!token) return res.json(false);

    const verified = jwt.verify(token, "qwertyuiop");

    const user = await userModel.findById(verified.userId);

    if (!user) return res.json(false);

    res.json(true);
  } catch (e) {
    res.status(500).json({
      message: e.message,
    });
  }
});

authRoute.get("/api/getUser", authMiddle, async (req, res) => {
  const userData = await userModel.findById(req.userId);

  console.log(userData);

  const token = req.token;

  res.json({ ...userData._doc, token});
});

export default authRoute;
