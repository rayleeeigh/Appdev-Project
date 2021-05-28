const ingredients = require("../models/ingredients")
const dishes = require("../models/dishes")
const dish_ingredients = require("../models/dish_ingredients");
const userDish = require("../models/userDish")
const { Op } = require("sequelize");


exports.readIngredients = async(req, res) => {
    let dataD = null;
    let data = await ingredients.model.findAll();
    res.render("generator", { ingredients: data, title: "Dish Generator", dishes: dataD, account: req.session.account });
}

exports.getIngredients = async(req, res) => {

    let data = await ingredients.model.findAll();
    let userDishes = await userDish.model.findAll();
    var x, y, z, m = 0,
        n = 0,
        a, b;
    let dataDI = []
    let dataD = []
    let dataI = []
    let dishI = []
    let ingrdt = []
    let i = []

    if (req.body.count > 1) {
        for (x = 0; x < req.body.count; x++) {
            dataDI.push(await dish_ingredients.model.findAll({
                where: {
                    ingredientID: req.body.ingredient[x]
                },
                raw: true
            }))
        }

        for (x = 0; x < req.body.count; x++) {
            dataDI[x] = await dish_ingredients.model.findOne({
                where: {
                    ingredientID: req.body.ingredient[x]
                },
                raw: true
            })
        }


    } else {
        for (x = 0; x < req.body.count; x++) {
            dataDI.push(await dish_ingredients.model.findAll({
                where: {
                    ingredientID: req.body.ingredient
                },
                raw: true
            }))
        }

        for (x = 0; x < req.body.count; x++) {
            dataDI[x] = await dish_ingredients.model.findOne({
                where: {
                    ingredientID: req.body.ingredient
                },
                raw: true
            })
        }
    }

    for (y = 0; y < dataDI.length; y++) {
        for (z = 0; z < dataD.length && dataDI[y].dishID != dataD[z].dishID; z++) {}

        if (z == dataD.length) {
            dataD[m] = await dishes.model.findOne({
                where: {
                    dishID: dataDI[y].dishID
                }
            })
            m++;
        }

    }

    for (x = 0; x < dataD.length; x++) {

        dataD[x].check = "0"
        for (z = 0; z < userDishes.length; z++) {
            if (userDishes[z].dishID == dataD[x].dishID) {
                dataD[x].check = "1"
            }
        }

        dishI[x] = await dish_ingredients.model.findAll({
            where: {
                dishID: dataD[x].dishID
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





    res.render("generator", { ingredients: data, title: "Dish Generator", dishes: dataD, dishingredient: dishI, ingredient: ingrdt, account: req.session.account });

}

exports.deleteIngredient = async(req, res) => {

    let ingredient = await ingredients.model.destroy({
        where: {
            ingredientID: req.query.id
        }
    })

    res.redirect("/adminprofile");
}

exports.editIngredient = async(req, res) => {
    let data = await ingredients.model.findByPk(req.body.id);

    data.ingredientName = req.body.ingname;
    data.ingredientType = req.body.ingtype;
    data.ingredientDescription = req.body.ingdesc;

    await data.save();
    res.redirect("/adminprofile");
}

exports.addIngredient = async(req, res) => {
    let data = await ingredients.model.create({
        ingredientName: req.body.ingname,
        ingredientDescription: req.body.ingdesc,
        ingredientType: req.body.ingtype
    })

    res.redirect("/adminprofile");
}