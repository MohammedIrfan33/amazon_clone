import express from "express";
import authRoute from "./routes/authRoutes.js";
import mongoose from "mongoose";

const PORT = 3000;
const Db = 'mongodb+srv://IRFAN:yKjYyUytCrpdUYSy@cluster0.uxtk5.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';
const app = express();


app.use(express.json())
app.use(authRoute);


app.get('/',(req,res)=>{

  res.send("Success");
 
})

mongoose
  .connect(Db)
  .then(() => {
    console.log("sucess");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, () => console.log(`server running on ${PORT}`));
