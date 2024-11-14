import jwt from "jsonwebtoken";
import dotent from "dotenv";

dotent.config();

export const createToken = (data) => {
  return jwt.sign({ payload: data }, process.env.ACCESS_TOKEN_KEY, {
    algorithm: "HS256",
    expiresIn: "1d",
  });
};

export const creatRefToken = (data) => {
    return jwt.sign({ payload: data }, process.env.REFRESH_SERECT, {
        algorithm: "HS256",
        expiresIn: "7d",
    });
}

export const verifyToken = (token) => {
  try {
    const user = jwt.verify(token, process.env.ACCESS_TOKEN_KEY);
    return user.payload.userId;
  } catch (error) {
    // không verify được token
    return false;
  }
};

export const middlewareToken = (req, res, next) => {
  let { token } = req.headers;
  let checkToken = verifyToken(token);
  if (checkToken) {
    req.authUser = checkToken;
    next();
  } else {
    res.status(401).json({ message: "Unauthorized" });
  }
};