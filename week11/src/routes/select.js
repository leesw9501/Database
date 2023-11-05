import express from "express";
// TODO
// sql import

const router = express.Router();

router.get('/', async function (req, res) {
    // TODO
    
    if (req.cookies.user) {
        res.render('select', { user: req.cookies.user });
    } else {
        res.render('/')
    }

});

router.post('/', async(req, res) => {
    // TODO
    const data = {
        cId: req.body.applyBtn,
        sId: req.cookies.user,
    };
});

module.exports = router;