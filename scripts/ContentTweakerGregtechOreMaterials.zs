#priorty 9999
#loader contenttweaker

import crafttweaker.item.IItemStack;
import mods.contenttweaker.Color;
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.MaterialSystem;

global OREDEFS as Material[string] = {
    "Palladium": MaterialSystem.getMaterialBuilder().setName("Palladium").setColor(5855840).build(),
    "Cobalt": MaterialSystem.getMaterialBuilder().setName("Cobalt").setColor(2895052).build(),
    "Monazite": MaterialSystem.getMaterialBuilder().setName("Monazite").setColor(4151615).build(),
    "Lepidolite": MaterialSystem.getMaterialBuilder().setName("Lepidolite").setColor(14891940).build(),
    "Grossular": MaterialSystem.getMaterialBuilder().setName("Grossular").setColor(16088576).build(),
    "NetherQuartz": MaterialSystem.getMaterialBuilder().setName("Nether Quartz").setColor(7300453).build(),
    "Tennantite": MaterialSystem.getMaterialBuilder().setName("Tennantite").setColor(8487297).build(),
    "Tin": MaterialSystem.getMaterialBuilder().setName("Tin").setColor(6250335).build(),
    "Pyrolusite": MaterialSystem.getMaterialBuilder().setName("Pyrolusite").setColor(8882073).build(),
    "Cinnabar": MaterialSystem.getMaterialBuilder().setName("Cinnabar").setColor(12451840).build(),
    "Pyrope": MaterialSystem.getMaterialBuilder().setName("Pyrope").setColor(8533612).build(),
    "Jasper": MaterialSystem.getMaterialBuilder().setName("Jasper").setColor(16082277).build(),
    "Phosphor": MaterialSystem.getMaterialBuilder().setName("Phosphor").setColor(14013696).build(),
    "Lithium": MaterialSystem.getMaterialBuilder().setName("Lithium").setColor(4802889).build(),
    "BrownLimonite": MaterialSystem.getMaterialBuilder().setName("Brown Limonite").setColor(6763776).build(),
    "Bauxite": MaterialSystem.getMaterialBuilder().setName("Bauxite").setColor(11426304).build(),
    "RockSalt": MaterialSystem.getMaterialBuilder().setName("Rock-Salt").setColor(7692641).build(),
    "Spodumene": MaterialSystem.getMaterialBuilder().setName("Spodumene").setColor(11245977).build(),
    "Cassiterite": MaterialSystem.getMaterialBuilder().setName("Cassiterite").setColor(7890020).build(),
    "Enargite": MaterialSystem.getMaterialBuilder().setName("Enargite").setColor(3158064).build(),
    "Uranium235": MaterialSystem.getMaterialBuilder().setName("Uranium-235").setColor(6094684).build(),
    "Ilmenite": MaterialSystem.getMaterialBuilder().setName("Ilmenite").setColor(4141357).build(),
    "Uraninite": MaterialSystem.getMaterialBuilder().setName("Uraninite").setColor(2039583).build(),
    "Silver": MaterialSystem.getMaterialBuilder().setName("Silver").setColor(8289938).build(),
    "Tanzanite": MaterialSystem.getMaterialBuilder().setName("Tanzanite").setColor(5308661).build(),
    "Graphite": MaterialSystem.getMaterialBuilder().setName("Graphite").setColor(5460819).build(),
    "Sulfur": MaterialSystem.getMaterialBuilder().setName("Sulfur").setColor(14934784).build(),
    "Chromite": MaterialSystem.getMaterialBuilder().setName("Chromite").setColor(2056725).build(),
    "Sphalerite": MaterialSystem.getMaterialBuilder().setName("Sphalerite").setColor(4276545).build(),
    "Iron": MaterialSystem.getMaterialBuilder().setName("Iron").setColor(10066329).build(),
    "Rutile": MaterialSystem.getMaterialBuilder().setName("Rutile").setColor(11144017).build(),
    "BandedIron": MaterialSystem.getMaterialBuilder().setName("Banded Iron").setColor(10314338).build(),
    "Garnierite": MaterialSystem.getMaterialBuilder().setName("Garnierite").setColor(2993727).build(),
    "Coal": MaterialSystem.getMaterialBuilder().setName("Coal").setColor(2434341).build(),
    "BlueTopaz": MaterialSystem.getMaterialBuilder().setName("Blue Topaz").setColor(136).build(),
    "Calcite": MaterialSystem.getMaterialBuilder().setName("Calcite").setColor(10526880).build(),
    "Gold": MaterialSystem.getMaterialBuilder().setName("Gold").setColor(16382405).build(),
    "Platinum": MaterialSystem.getMaterialBuilder().setName("Platinum").setColor(10461023).build(),
    "Chalcocite": MaterialSystem.getMaterialBuilder().setName("Chalcocite").setColor(3092271).build(),
    "Lignite": MaterialSystem.getMaterialBuilder().setName("Lignite").setColor(5914431).build(),
    "Iridium": MaterialSystem.getMaterialBuilder().setName("Iridium").setColor(9869010).build(),
    "Osmium": MaterialSystem.getMaterialBuilder().setName("Osmium").setColor(5724114).build(),
    "Tantalite": MaterialSystem.getMaterialBuilder().setName("Tantalite").setColor(8538148).build(),
    "Bornite": MaterialSystem.getMaterialBuilder().setName("Bornite").setColor(11343360).build(),
    "Neodymium": MaterialSystem.getMaterialBuilder().setName("Neodymium").setColor(7039851).build(),
    "Magnetite": MaterialSystem.getMaterialBuilder().setName("Magnetite").setColor(1052688).build(),
    "Cooperite": MaterialSystem.getMaterialBuilder().setName("Sheldonite").setColor(11447982).build(),
    "Ruby": MaterialSystem.getMaterialBuilder().setName("Ruby").setColor(15686748).build(),
    "Saltpeter": MaterialSystem.getMaterialBuilder().setName("Saltpeter").setColor(13092807).build(),
    "Scheelite": MaterialSystem.getMaterialBuilder().setName("Scheelite").setColor(11435538).build(),
    "Redstone": MaterialSystem.getMaterialBuilder().setName("Redstone").setColor(11403264).build(),
    "Magnesite": MaterialSystem.getMaterialBuilder().setName("Magnesite").setColor(8289909).build(),
    "Lazurite": MaterialSystem.getMaterialBuilder().setName("Lazurite").setColor(7769572).build(),
    "VanadiumMagnetite": MaterialSystem.getMaterialBuilder().setName("Vanadium-Magnetite").setColor(2039606).build(),
    "Topaz": MaterialSystem.getMaterialBuilder().setName("Topaz").setColor(16097792).build(),
    "Tenorite": MaterialSystem.getMaterialBuilder().setName("Tenorite").setColor(7303023).build(),
    "Bastnasite": MaterialSystem.getMaterialBuilder().setName("Bastnasite").setColor(12610861).build(),
    "Niobium": MaterialSystem.getMaterialBuilder().setName("Niobium").setColor(8747161).build(),
    "Sodalite": MaterialSystem.getMaterialBuilder().setName("Sodalite").setColor(1513443).build(),
    "Tetrahedrite": MaterialSystem.getMaterialBuilder().setName("Tetrahedrite").setColor(11410688).build(),
    "Opal": MaterialSystem.getMaterialBuilder().setName("Opal").setColor(170).build(),
    "Beryllium": MaterialSystem.getMaterialBuilder().setName("Beryllium").setColor(5939802).build(),
    "NaquadahEnriched": MaterialSystem.getMaterialBuilder().setName("Enriched Naquadah").setColor(2368548).build(),
    "Lead": MaterialSystem.getMaterialBuilder().setName("Lead").setColor(4797513).build(),
    "Phosphate": MaterialSystem.getMaterialBuilder().setName("Phosphate").setColor(11447808).build(),
    "CassiteriteSand": MaterialSystem.getMaterialBuilder().setName("Cassiterite Sand").setColor(14935011).build(),
    "Lapis": MaterialSystem.getMaterialBuilder().setName("Lapis").setColor(4276661).build(),
    "Pentlandite": MaterialSystem.getMaterialBuilder().setName("Pentlandite").setColor(11772677).build(),
    "Molybdenum": MaterialSystem.getMaterialBuilder().setName("Molybdenum").setColor(5855604).build(),
    "Emerald": MaterialSystem.getMaterialBuilder().setName("Emerald").setColor(6681957).build(),
    "Galena": MaterialSystem.getMaterialBuilder().setName("Galena").setColor(5912154).build(),
    "Vinteum": MaterialSystem.getMaterialBuilder().setName("Vinteum").setColor(8320501).build(),
    "Quartzite": MaterialSystem.getMaterialBuilder().setName("Quartzite").setColor(7503218).build(),
    "Diamond": MaterialSystem.getMaterialBuilder().setName("Diamond").setColor(8035484).build(),
    "Almandine": MaterialSystem.getMaterialBuilder().setName("Almandine").setColor(16056320).build(),
    "Talc": MaterialSystem.getMaterialBuilder().setName("Talc").setColor(4755528).build(),
    "Molybdenite": MaterialSystem.getMaterialBuilder().setName("Molybdenite").setColor(526344).build(),
    "Pyrite": MaterialSystem.getMaterialBuilder().setName("Pyrite").setColor(8875044).build(),
    "Thorium": MaterialSystem.getMaterialBuilder().setName("Thorium").setColor(9984).build(),
    "Olivine": MaterialSystem.getMaterialBuilder().setName("Olivine").setColor(5941850).build(),
    "Apatite": MaterialSystem.getMaterialBuilder().setName("Apatite").setColor(11184810).build(),
    "Glauconite": MaterialSystem.getMaterialBuilder().setName("Glauconite").setColor(7709238).build(),
    "Pitchblende": MaterialSystem.getMaterialBuilder().setName("Pitchblende").setColor(3882496).build(),
    "Malachite": MaterialSystem.getMaterialBuilder().setName("Malachite").setColor(283908).build(),
    "Aluminium": MaterialSystem.getMaterialBuilder().setName("Aluminium").setColor(7581358).build(),
    "Tungstate": MaterialSystem.getMaterialBuilder().setName("Tungstate").setColor(3946022).build(),
    "GreenSapphire": MaterialSystem.getMaterialBuilder().setName("Green Sapphire").setColor(5810802).build(),
    "Sapphire": MaterialSystem.getMaterialBuilder().setName("Sapphire").setColor(5789866).build(),
    "Uranium": MaterialSystem.getMaterialBuilder().setName("Uranium-238").setColor(2993709).build(),
    "Nickel": MaterialSystem.getMaterialBuilder().setName("Nickel").setColor(10066350).build(),
    "Chalcopyrite": MaterialSystem.getMaterialBuilder().setName("Chalcopyrite").setColor(5586965).build(),
    "Barite": MaterialSystem.getMaterialBuilder().setName("Barite").setColor(6776679).build(),
    "Amethyst": MaterialSystem.getMaterialBuilder().setName("Amethyst").setColor(11152554).build(),
    "Bentonite": MaterialSystem.getMaterialBuilder().setName("Bentonite").setColor(13816530).build(),
    "Oilsands": MaterialSystem.getMaterialBuilder().setName("Oilsands").setColor(657930).build(),
    "Spessartine": MaterialSystem.getMaterialBuilder().setName("Spessartine").setColor(5910062).build(),
    "Soapstone": MaterialSystem.getMaterialBuilder().setName("Soapstone").setColor(3296562).build(),
    "Cobaltite": MaterialSystem.getMaterialBuilder().setName("Cobaltite").setColor(4737198).build(),
    "Copper": MaterialSystem.getMaterialBuilder().setName("Copper").setColor(11892736).build(),
    "Powellite": MaterialSystem.getMaterialBuilder().setName("Powellite").setColor(6776576).build(),
    "Zinc": MaterialSystem.getMaterialBuilder().setName("Zinc").setColor(6712399).build(),
    "GarnetRed": MaterialSystem.getMaterialBuilder().setName("Red Garnet").setColor(5907749).build(),
    "Bismuth": MaterialSystem.getMaterialBuilder().setName("Bismuth").setColor(7122349).build(),
    "Wulfenite": MaterialSystem.getMaterialBuilder().setName("Wulfenite").setColor(6767616).build(),
    "Cuprite": MaterialSystem.getMaterialBuilder().setName("Cuprite").setColor(9895936).build(),
    "GarnetYellow": MaterialSystem.getMaterialBuilder().setName("Yellow Garnet").setColor(11184710).build(),
    "Naquadah": MaterialSystem.getMaterialBuilder().setName("Naquadah").setColor(1776411).build(),
    "Salt": MaterialSystem.getMaterialBuilder().setName("Salt").setColor(10197915).build(),
    "YellowLimonite": MaterialSystem.getMaterialBuilder().setName("Yellow Limonite").setColor(13880211).build(),
    "CertusQuartz": MaterialSystem.getMaterialBuilder().setName("Certus Quartz").setColor(12237498).build(),
    "Stibnite": MaterialSystem.getMaterialBuilder().setName("Stibnite").setColor(4144959).build(),
    "Amber": MaterialSystem.getMaterialBuilder().setName("Amber").setColor(16750866).build()
};

function addMaterialOre (mat as Material, key as string) {
    var ore_types = ["ore"] as string[];
    var ores = mat.registerParts(ore_types);

    for i, ore in ores {
        var oreData = ore.getData();
        oreData.addDataValue("variants", "undergroundbiomes:red_granite,undergroundbiomes:red_granite_sand,undergroundbiomes:red_granite_gravel,undergroundbiomes:black_granite,undergroundbiomes:black_granite_sand,undergroundbiomes:black_granite_gravel,undergroundbiomes:rhyolite,undergroundbiomes:rhyolite_sand,undergroundbiomes:rhyolite_gravel,undergroundbiomes:andesite,undergroundbiomes:andesite_sand,undergroundbiomes:andesite_gravel,undergroundbiomes:gabbro,undergroundbiomes:gabbro_sand,undergroundbiomes:gabbro_gravel,undergroundbiomes:basalt,undergroundbiomes:basalt_sand,undergroundbiomes:basalt_gravel,undergroundbiomes:komatiite,undergroundbiomes:komatiite_sand,undergroundbiomes:komatiite_gravel,undergroundbiomes:dacite,undergroundbiomes:dacite_sand,undergroundbiomes:dacite_gravel,undergroundbiomes:gneiss,undergroundbiomes:gneiss_sand,undergroundbiomes:gneiss_gravel,undergroundbiomes:eclogite,undergroundbiomes:eclogite_sand,undergroundbiomes:eclogite_gravel,undergroundbiomes:marble,undergroundbiomes:marble_sand,undergroundbiomes:marble_gravel,undergroundbiomes:quartzite,undergroundbiomes:quartzite_sand,undergroundbiomes:quartzite_gravel,undergroundbiomes:blueschist,undergroundbiomes:blueschist_sand,undergroundbiomes:blueschist_gravel,undergroundbiomes:greenschist,undergroundbiomes:greenschist_sand,undergroundbiomes:greenschist_gravel,undergroundbiomes:soapstone,undergroundbiomes:soapstone_sand,undergroundbiomes:soapstone_gravel,undergroundbiomes:migmatite,undergroundbiomes:migmatite_sand,undergroundbiomes:migmatite_gravel,undergroundbiomes:limestone,undergroundbiomes:limestone_sand,undergroundbiomes:limestone_gravel,undergroundbiomes:chalk,undergroundbiomes:chalk_sand,undergroundbiomes:chalk_gravel,undergroundbiomes:shale,undergroundbiomes:shale_sand,undergroundbiomes:shale_gravel,undergroundbiomes:siltstone,undergroundbiomes:siltstone_sand,undergroundbiomes:siltstone_gravel,undergroundbiomes:lignite,undergroundbiomes:lignite_sand,undergroundbiomes:lignite_gravel,undergroundbiomes:dolomite,undergroundbiomes:dolomite_sand,undergroundbiomes:dolomite_gravel,undergroundbiomes:greywacke,undergroundbiomes:greywacke_sand,undergroundbiomes:greywacke_gravel,undergroundbiomes:chert,undergroundbiomes:chert_sand,undergroundbiomes:chert_gravel,quark:elder_prismarine,earthworks:slate_green,earthworks:block_slate,earthworks:slate_purple,rustic:slate,quark:icy_stone,quark:fire_stone");
        oreData.addDataValue("hardness", "10");
        oreData.addDataValue("resistance", "10");
        oreData.addDataValue("harvestTool", "pickaxe");
        oreData.addDataValue("harvestLevel", "1");
    }

    mat.registerPart("clump");
}

for key, material in OREDEFS {
    addMaterialOre(material, key);
}