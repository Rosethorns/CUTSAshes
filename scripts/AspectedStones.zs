import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;
import mods.astralsorcery.Grindstone;
import mods.inspirations.Cauldron;
import mods.thaumcraft.Crucible;
import thaumcraft.aspect.CTAspectStack;

<ore:midnightOreBase>.addItems([<midnight:nightstone>, <midnight:trenchstone>]);

var names = [
    "Dusk",
    "Light",
    "Flame",
    "Water",
    "Wind",
    "Earth"
] as string[];

var nightstone = [
    <contenttweaker:dusk_aspected_nightstone>,
    <contenttweaker:light_aspected_nightstone>,
    <contenttweaker:flame_aspected_nightstone>,
    <contenttweaker:wind_aspected_nightstone>,
    <contenttweaker:water_aspected_nightstone>,
    <contenttweaker:earth_aspected_nightstone>
] as IItemStack[];
var trenchstone = [
    <contenttweaker:dusk_aspected_trenchstone>,
    <contenttweaker:light_aspected_trenchstone>,
    <contenttweaker:flame_aspected_trenchstone>,
    <contenttweaker:wind_aspected_trenchstone>,
    <contenttweaker:water_aspected_trenchstone>,
    <contenttweaker:earth_aspected_trenchstone>
] as IItemStack[];

var aspects = [
    <aspect:perditio>,
    <aspect:ordo>,
    <aspect:ignis>,
    <aspect:aer>,
    <aspect:aqua>,
    <aspect:terra>
] as CTAspectStack[];

var aspectCrystals = [
    <thaumcraft:crystal_perditio>,
    <thaumcraft:crystal_ordo>,
    <thaumcraft:crystal_ignis>,
    <thaumcraft:crystal_aer>,
    <thaumcraft:crystal_aqua>,
    <thaumcraft:crystal_terra>
] as IItemStack[];

for idx, name in names {
    var thedict = oreDict.get("ore" + name + "AspectedStone");
    thedict.addItems([nightstone[idx], trenchstone[idx]]);

    nightstone[idx].displayName = (name + " Aspected Nightstone");
    trenchstone[idx].displayName = (name + " Aspected Trenchstone");

    nightstone[idx].setAspects(aspects[idx] * 5);
    trenchstone[idx].setAspects(aspects[idx] * 5);

    Grindstone.addRecipe(thedict, aspectCrystals[idx], 0.5f);

    Crucible.registerRecipe(
        "aspectedStone" + name, 
        "METALPURIFICATION",
        aspectCrystals[idx] * 6,
        thedict,
        [<aspect:perditio> * 2, <aspect:ordo> * 2]
    );

    Cauldron.addFluidRecipe(aspectCrystals[idx] * 8, thedict * 1, <liquid:purifying_fluid>, 1, true);
}
