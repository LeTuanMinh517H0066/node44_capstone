import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const userProfile = async (req, res) => {
  try {
    // const { user_id } = req.body;

    var user_id = req.authUser;
    const user = await prisma.users.findUnique({
      where: {
        id: Number(user_id),
      },
    });
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }
    return res.status(200).json(user);
  } catch (error) {
    return res.satus(500).json({ message: "error" });
  }
};

const userSavedImage = async (req, res) => {
  try {
    // const { user_id } = req.params;
    var user_id = req.authUser;
    const data = await prisma.saved_images.findMany({
      where: {
        user_id: Number(user_id),
      },
      include: {
        images: true,
      },
    });
    return res.status(200).json(data);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "error" });
  }
};

const userImage = async (req, res) => {
  try {
    // const { user_id } = req.params;
    var user_id = req.authUser;
    const data = await prisma.images.findMany({
      where: {
        user_id: Number(user_id),
      },
    });
    return res.status(200).json(data);
    å;
  } catch (error) {
    return res.satus(500).json({ message: "error" });
  }
};

const updateProfile = async (req, res) => {
  try {
    let user_id = req.authUser;

    let file = req.file;
    let {name, email, age} = req.body;

    let imagePath = `/public/imgs/${file.filename}`;

    let userProfile = await prisma.users.findFirst(
      {
        where:{
          id: Number(user_id),
        }
      }
    ) 

    let user = await prisma.users.update({
      where: {
        id: Number(user_id),
      },
      data: {
        name: name ? name : userProfile.name,
        email: email ? email : userProfile.email,
        avatar: imagePath ? imagePath : userProfile.avatar,
        age: age ? Number(age) : Number(userProfile.age)
      },
    });

    return res.status(200).json(user)
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "error" });
  }
};
export { userProfile, userSavedImage, userImage, updateProfile };
