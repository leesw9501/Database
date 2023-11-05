import cookieParser from "cookie-parser";
import express from "express";
import expressSession from 'express-session';
const router = express.Router();

router.use(cookieParser());
router.use(expressSession({
    secret: 'dilab',
    resave: true,
    saveUninitialized: true,
}));

router.get('/logout', (req, res) => {
    if (req.cookies.user) {
        res.clearCookie('user');
        res.redirect("/");
    } else {
        res.redirect("/");
    }
})

module.exports = router;