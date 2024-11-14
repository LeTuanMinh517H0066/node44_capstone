import express from 'express';
import { userProfile, userSavedImage, userImage, updateProfile } from "../controllers/user.controller.js";
import { middlewareToken } from '../config/jwt.js';
import { upload } from '../config/upload.js';



const userRouter = express.Router();

userRouter.get('/get-profile',middlewareToken, userProfile);
userRouter.get('/get-saved-image/:user_id',middlewareToken, userSavedImage);
userRouter.get('/get-image/:user_id',middlewareToken, userImage);
userRouter.post('/update-profile',upload.single("avatar"), middlewareToken, updateProfile)
export default userRouter;