import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.gregtech.recipe.RecipeMap;
import mods.inspirations.Cauldron;

var mixer = RecipeMap.getByName("mixer");
var oilyMud = <contenttweaker:oily_mud>;

// Because earthworks is too good for oredicts apparently
<ore:blockMud>.add(<earthworks:block_mud>);

// Add oredicts for the oil buckets:
for fluid in (["oil", "oil_heavy", "oil_light", "oil_medium"] as string[]) {
    recipes.addShapeless(oilyMud, [<ore:blockMud>, <forge:bucketfilled>.withTag({FluidName: fluid, Amount: 1000})]);
}

for fluid in ([<fluid:oil>, <fluid:oil_heavy>, <fluid:oil_light>, <fluid:oil_medium>] as ILiquidStack[]) {
    // Add Cauldron: 4:1
    Cauldron.addFluidRecipe(oilyMud, <ore:blockMud>, fluid, 2);

    // Add mixer: 8:1
    mixer.recipeBuilder()
        .inputs(<ore:blockMud>)
        .fluidInputs([fluid * 250])
        .outputs(<contenttweaker:oily_mud>)
        .duration(600)
        .EUt(12)
        .buildAndRegister();
}
