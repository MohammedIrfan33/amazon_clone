import jwt from 'jsonwebtoken';

const authMiddle = async (req,res,next) =>{

   try{

    const token = req.header('x-auth-token');

    if(!token){

        res.status(401).json({
            message:"No token ,access denaid"
        });
    }
    const verified = jwt.verify(token, "qwertyuiop");
    if(!verified){
        res.status(401).json({
            message:"Token verification faild,autherization denied"
        })
    }

    console.log(`verification completed ${verified.userId}`);

    req.userId = verified.userId;
    req.token = token;
    next();

   }catch(e){

    res.status(500).json({
        message: e.message,
      });


   }
    
    

}


export default  authMiddle