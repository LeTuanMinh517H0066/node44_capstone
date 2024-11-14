import express from "express";
import cookieParser from "cookie-parser";
import rootRoutes from "./src/routes/root.router.js";


const app = express();

app.use(express.json());
app.use(express.static("."))

// thêm middeware để get info cookie
app.use(cookieParser());

// import rootRoutes

app.use(rootRoutes)

app.listen(8085, () => {
    console.log("Server is starting with port 8085");
})