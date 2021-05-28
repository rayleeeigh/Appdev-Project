const dish_ingredients = require("../models/dish_ingredients")
const dishes = require("../models/dishes")
const ingredients = require("../models/ingredients")



exports.readDI = async(req, res) => {

    var x;
    let dataI = []
    let data = await dishes.model.findOne({
        where: {
            dishID: req.query.id
        },
        raw: true
    });


    let dataDI = await dish_ingredients.model.findAll({
        where: {
            dishID: req.query.id
        },
        raw: true
    })

    for (x = 0; x < dataDI.length; x++) {
        dataI[x] = await ingredients.model.findOne({
            where: {
                ingredientID: dataDI[x].ingredientID
            }
        })
    }
    res.render("sample", { dish: data, ingredient: dataI, DI: dataDI, title: "Dish", account: req.session.account });
}

exports.editDishIngredients = async(req, res) => {

    let data = await dish_ingredients.model.findByPk(req.body.diID);


    if (data==null){
        data = await dish_ingredients.model.create({
            dishID: req.body.dishid,
            ingredientID:req.body.ingid,
            amount: req.body.editamount,
            measurement: req.body.editmeasurement,
            createdAt:true
        })
    }

    else{
        data.amount = req.body.editamount;
        data.measurement = req.body.editmeasurement;

        await data.save();
    }

    res.redirect("/adminprofile");
}

exports.deleteDishIngredient = async(req, res) => {

    let data = await dish_ingredients.model.destroy({
        where: {
            dishIngID: req.query.id
        }
    })

    res.redirect("/adminprofile");
}