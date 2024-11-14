import { PrismaClient } from "@prisma/client";
import jwt from "jsonwebtoken";

const prisma = new PrismaClient();

const imageList = async (req, res) => {
  try {
    // let data = await prisma.images.findMany();
    const { page, size, keyword } = req.query;
    console.log(keyword);
    const formatPage = page ? Number(page) : 1;
    const formatSize = size ? Number(size) : 10;

    let data = await prisma.images.findMany({
      where: keyword
        ? {
            name: {
              contains: keyword,
            },
          }
        : {},
      skip: (formatPage - 1) * formatSize,
      take: formatSize,
    });

    return res.status(200).json(data);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "error" });
  }
};

const imageDetail = async (req, res) => {
  try {
    const id = req.params.id;
    const data = await prisma.images.findFirst({
      where: {
        id: Number(id),
      },
      include: {
        users: true,
      },
    });
    return res.status(200).json(data);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "error" });
  }
};

const imageComments = async (req, res) => {
  try {
    const id = req.params.id;
    const data = await prisma.comments.findMany({
      where: {
        image_id: Number(id),
      },
      include: {
        users: true,
        images: true,
      },
    });
    return res.status(200).json(data);
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const isImageSaved = async (req, res) => {
  try {
    const { image_id, user_id } = req.body;

    var usercheck = req.authUser;

    const data = await prisma.saved_images.findFirst({
      where: {
        image_id: Number(image_id),
        user_id: Number(usercheck),
      },
    });
    if (data) {
      return res.status(200).json({ saved: true });
    } else {
      return res.status(200).json({ saved: false });
    }
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const saveUserComment = async (req, res) => {
  try {
    var user = req.authUser;
    const { image_id, comment } = req.body;
    const data = await prisma.comments.create({
      data: {
        image_id: Number(image_id),
        user_id: Number(user),
        comment: comment,
      },
      include: {
        users: true,
        images: true,
      },
    });
    return res.status(200).json({ data });
  } catch (error) {
    return res.status(500).json({ message: "error" });
  }
};

const deleteImage = async (req, res) => {
  try {
    const { image_id } = req.body;
    var user_id = req.authUser;
    const data = await prisma.images.delete({
      where: {
        id: Number(image_id),
        user_id: Number(user_id),
      },
    });

    return res.status(200).json({message:"delete image successfully"});
  } catch (error) {
    return res.status.json({ message: "error" });
  }
};

const uploadImage = async (req, res) => {
  try {
    let file= req.file;

    let {name, description} = req.body;
    // console.log(name);

    let user_id = req.authUser;
    let imagePath = `/public/imgs/${file.filename}`;
    

    let imageTopic = await prisma.images.create({
      data: {
        url: imagePath,
        user_id: Number(user_id),
        name: name,
        description: description
      },
    })

    return res.status(200).json(imageTopic);
  } catch (error) {
    console.log(error);
    return res.status(500).json({message: 'error'});
  }
}

export {
  imageList,
  imageDetail,
  imageComments,
  isImageSaved,
  saveUserComment,
  deleteImage,
  uploadImage
};
