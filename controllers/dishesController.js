const dishes = require("../models/dishes")
const ingredients = require("../models/ingredients")
const dish_ingredients = require("../models/dish_ingredients")
const userDish = require("../models/userDish")
const { Op } = require("sequelize");

exports.readDishes = async(req, res) => {

    let alldish = await dishes.model.findAll();
    let userDishes = await userDish.model.findAll();
    var dishI = new Array(alldish.length);
    var ingrdt = new Array(alldish.length);
    var i = new Array();
    var x, y, z;


    for (x = 0; x < alldish.length; x++) {

        alldish[x].check = "0"
        for (z = 0; z < userDishes.length; z++) {
            if (userDishes[z].dishID == alldish[x].dishID) {
                alldish[x].check = "1"
            }
        }

        dishI[x] = await dish_ingredients.model.findAll({
            where: {
                dishID: alldish[x].dishID
            }
        });

        for (y = 0; y < dishI[x].length; y++) {
            i[y] = dishI[x][y].ingredientID;
        }

        for (y = 0; y < dishI[x].length; y++) {
            ingrdt[x] = await ingredients.model.findAll({
                where: {
                    ingredientID: {
                        [Op.in]: i
                    }
                }
            });
        }
    }

    res.render("dishlist", { dishes: alldish, title: "Dish List", dishingredient: dishI, ingredient: ingrdt, account: req.session.account });
}

exports.deleteDish = async(req, res) => {

    let dish = await dishes.model.destroy({
        where: {
            dishID: req.query.id
        }
    })

    let dishI = await dish_ingredients.model.destroy({
        where: {
            dishID: req.query.id
        }
    })

    let data = await userDish.model.destroy({
        where: {
            dishID: req.query.id
        }
    })

    res.redirect("back");
}

exports.addDish = async(req, res) => {

    var dishingredientdata;

    let dishdata = await dishes.model.create({
        dishName: req.body.dishname,
        dishDescription: req.body.dishdescription ,
        dishMenu: req.body.dishmenu ,
        dishPic: req.files.dishpic.name
    })
    sampleFile = req.files.dishpic;
    uploadPath = __dirname + '/public/storage/Dishes/' + sampleFile.name;

    sampleFile.mv('./public/storage/Dishes/' + req.files.dishpic.name, function(err) {
        if (err) return res.status(500).send(err);

        console.log(sampleFile);
    })

    var x;

    for (x=0; x<req.body.addingredient.length; x++){
        dishingredientdata = await dish_ingredients.model.create({
            dishID: dishdata.dishID,
            ingredientID: req.body.addingredient[x],
            amount: req.body.addamount[x],
            measurement: req.body.addmeasurement[x]
        })
    }

    res.redirect("/adminprofile");
}

exports.editDish = async(req, res) => {
    let data = await dishes.model.findByPk(req.body.editdishid);

    data.dishName = req.body.editdishname;
    data.dishDesc = req.body.editdishdesc;
    data.dishMenu = req.body.editdishmenu;

    await data.save();

    res.redirect("/adminprofile");
}