import express from 'express';
import { imageList, imageDetail, imageComments,isImageSaved, saveUserComment, deleteImage,uploadImage } from "../controllers/image.controller.js";
import { middlewareToken } from '../config/jwt.js';
import { upload } from '../config/upload.js';


const imageRouter = express.Router();

imageRouter.get('/get-images', imageList);
imageRouter.get('/detail/:id', imageDetail);
imageRouter.get('/get-comments/:id',imageComments);
imageRouter.get('/check-saved',middlewareToken,isImageSaved);
imageRouter.post('/save-comment',middlewareToken, saveUserComment);
imageRouter.delete('/delete-image',middlewareToken, deleteImage);
imageRouter.post('/upload-image',upload.single("hinhAnh"),middlewareToken,uploadImage)
export default imageRouter;
