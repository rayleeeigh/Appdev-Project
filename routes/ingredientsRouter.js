const express = require("express");
const router = express.Router();
const ingredientsController = require("../controllers/ingredientsController");

router.get("/generate", ingredientsController.readIngredients);
router.post("/generate", ingredientsController.getIngredients);
router.get("/deleteingredient", ingredientsController.deleteIngredient);
router.post("/editIng", ingredientsController.editIngredient);
router.post("/addIng", ingredientsController.addIngredient);
module.exports = router;