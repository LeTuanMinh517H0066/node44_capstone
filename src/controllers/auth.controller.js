import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import transporter from "../config/transporter.js";
import { createToken, creatRefToken } from "../config/jwt.js";

const prisma = new PrismaClient();

const register = async (req, res) => {
  try {
    let { email, name, password, age } = req.body;
    let userExist = await prisma.users.findFirst({
      where: {
        email: email,
      },
    });
    if (userExist) {
      return res.status(400).json({ message: "Email already exist" });
    }

    const userNew = await prisma.users.create({
      data: {
        name: name,
        email: email,
        password: bcrypt.hashSync(password, 10),
        age: Number(age),
        created_at: new Date(),
        updated_at: new Date(),
      },
    });

    const mailOption = {
      from: "ltuanminh049@gmail.com",
      to: email,
      subject: "Xác nhận tài khoản",
      text: `Hello ${name}. Best regards.`,
    };

    transporter.sendMail(mailOption, (err, info) => {
      if (err) {
        console.log(err);
        return res
          .status(INTERNAL_SERVER)
          .json({ message: "Sending email error" });
      }
      return res.status(OK).json({
        message: `Đăng ký thành công`,
        data: userNew,
      });
    });

    return res.status(200).json(userNew);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "error" });
  }
};

const login = async (req, res) => {
  try {
    let { email, password } = req.body;

    let user = await prisma.users.findFirst({
      where: {
        email: email,
      },
    });

    if (!user) {
      return res.status(400).json({ message: "Email is wrong" });
    }

    let checkPass = bcrypt.compareSync(password, user.password);
    if (!checkPass) {
      return res.status(400).json({ message: "Pass is wrong" });
    }

    let accessToken = createToken({ userId: user.id });

    let refreshToken = creatRefToken({ userId: user.user_id });

    await prisma.users.update({
      where: {
        id: user.id,
      },
      data: {
        refreshToken: refreshToken,
      },
    });

    res.cookie("refreshToken", refreshToken, {
      httpOnly: true, // cookie không thể truy cập được từ js để bảo mật
      secure: false, // dùng cho local, nếu chạy trên https set là true
      sameSite: "Lax", // đảm bảo cho cookie được gửi trong nhiều domain khác nhau
      maxAge: 7 * 24 * 60 * 60 * 1000, //thời gian tồn tại là 7 ngày
    });

    return res.status(200).json({
      message: "Đăng nhập thành công",
      data: accessToken,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "error" });
  }
};

export { register, login };
