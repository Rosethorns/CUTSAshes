import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.liquid.ILiquidStack;

import mods.gregtech.recipe.RecipeMap;

var mixer = RecipeMap.getByName("mixer");
var centrifuge = RecipeMap.getByName("centrifuge");

// Add Pam compat
// TODO: Consider if unsweetened_chocolate should be included, 
// or if it should be used in place of chocolate in other recipes
<ore:foodChocolatebar>.addItems([
    <nuclearcraft:dark_chocolate>,
    <nuclearcraft:milk_chocolate>
] as IItemStack[]);

<ore:foodCocoapowder>.addAll(<ore:dustCocoa>);

// Sugar is sugar in fluid extractor

centrifuge.recipeBuilder()
    .inputs(<nuclearcraft:ground_cocoa_nibs>)
    .outputs(<nuclearcraft:cocoa_solids>)
    .fluidOutputs(<fluid:cocoa_butter> * 144)
    .duration(300)
    .EUt(8)
    .buildAndRegister();

mixer.recipeBuilder()
    .fluidInputs([<fluid:chocolate_liquor> * 144, <fluid:cocoa_butter> * 144])
    .fluidOutputs(<fluid:unsweetened_chocolate> * 288)
    .duration(300)
    .EUt(8)
    .buildAndRegister();

mixer.recipeBuilder()
    .fluidInputs([<fluid:unsweetened_chocolate> * 144, <fluid:sugar> * 72])
    .fluidOutputs(<fluid:dark_chocolate> * 288)
    .duration(300)
    .EUt(8)
    .buildAndRegister();

for fluid in ([<fluid:milk>, <fluid:milk_friesian>, <fluid:milk_goat>, <fluid:milk_holstein>, <fluid:milk_jersey>, <fluid:milk_sheep>] as ILiquidStack[]) {
    mixer.recipeBuilder()
        .fluidInputs([<fluid:dark_chocolate> * 144, fluid * 250])
        .fluidOutputs(<fluid:milk_chocolate> * 288)
        .duration(300)
        .EUt(8)
        .buildAndRegister();
}



// Marshmellow
mixer.recipeBuilder()
    .fluidInputs([<fluid:gelatin> * 144, <fluid:water> * 500])
    .fluidOutputs(<fluid:hydrated_gelatin> * 144)
    .duration(300)
    .EUt(8)
    .buildAndRegister();

mixer.recipeBuilder()
    .fluidInputs([<fluid:hydrated_gelatin> * 144, <fluid:sugar> * 72])
    .fluidOutputs(<fluid:marshmallow> * 144)
    .duration(300)
    .EUt(8)
    .buildAndRegister();
