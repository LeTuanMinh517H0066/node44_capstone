import express from 'express';
import authRouter from './auth.router.js';
import imageRouter from './image.route.js';
import userRouter from './user.router.js';

const rootRoutes = express.Router();
rootRoutes.use("/auth", authRouter);
rootRoutes.use("/images", imageRouter);
rootRoutes.use("/users", userRouter);

export default rootRoutes;
