// Ye olde list of things to stop spamming.

/* 
// Hide the stamping from Soot that gets applied to literally every item
mods.jei.JEI.hide(<soot:stamp_text>);

// Condense down items:
// None of this works, because of course it wouldnt
mods.jei.JEI.hide(<agricraft:water_tank>);
mods.jei.JEI.addItem(<agricraft:water_tank>.withTag({agri_material_meta: 0, agri_meterial: "minecraft:planks"}));

mods.jei.JEI.hide(<agricraft:water_channel_normal>);
mods.jei.JEI.addItem(<agricraft:water_channel_normal>.withTag({agri_material_meta: 0, agri_meterial: "minecraft:planks"}));

mods.jei.JEI.hide(<agricraft:water_channel_full>);
mods.jei.JEI.addItem(<agricraft:water_channel_full>.withTag({agri_material_meta: 0, agri_meterial: "minecraft:planks"}));

mods.jei.JEI.hide(<agricraft:water_channel_valve>);
mods.jei.JEI.addItem(<agricraft:water_channel_valve>.withTag({agri_material_meta: 0, agri_meterial: "minecraft:planks"}));

mods.jei.JEI.hide(<agricraft:grate>);
mods.jei.JEI.addItem(<agricraft:grate>.withTag({agri_material_meta: 0, agri_meterial: "minecraft:planks"}));

mods.jei.JEI.hide(<extracells:pattern.fluid>);
mods.jei.JEI.addItem(<extracells:pattern.fluid>);

mods.jei.JEI.hide(<forestry:can>);
mods.jei.JEI.addItem(<forestry:can>);

mods.jei.JEI.hide(<forestry:capsule>);
mods.jei.JEI.addItem(<forestry:capsule>);

mods.jei.JEI.hide(<forestry:refractory>);
mods.jei.JEI.addItem(<forestry:refractory>);

mods.jei.JEI.hide(<gendustry:gene_template>);
mods.jei.JEI.addItem(<gendustry:gene_template>);

mods.jei.JEI.hide(<gregtech:meta_item_1:32405>); // Steel cell
mods.jei.JEI.addItem(<gregtech:meta_item_1:32405>);

mods.jei.JEI.hide(<gregtech:meta_item_1:32762>); // Cell
mods.jei.JEI.addItem(<gregtech:meta_item_1:32762>);

mods.jei.JEI.hide(<gregtech:meta_item_1:32406>); // Tungstensteel cell
mods.jei.JEI.addItem(<gregtech:meta_item_1:32406>);

mods.jei.JEI.hide(<thaumcraft:phial>);
mods.jei.JEI.addItem(<thaumcraft:phial>);

// Just hide it outright:
mods.jei.JEI.hide(<gendustry:gene_sample>);
mods.jei.JEI.hide(<forge:bucketfilled>); 
*/

val fluids = [
    "absinthe",
    "acetic_acid",
    "acetone",
    "air",
    "alchemical_redstone",
    "ale",
    "alewort",
    "allyl_chloride",
    "alugentum",
    "alumina",
    "aluminium",
    "aluminum",
    "americium",
    "americium_241",
    "americium_241_fluoride",
    "americium_241_fluoride_flibe",
    "americium_242",
    "americium_242_fluoride",
    "americium_242_fluoride_flibe",
    "americium_243",
    "americium_243_fluoride",
    "americium_243_fluoride_flibe",
    "ammonia",
    "animania_honey",
    "annealed_copper",
    "antimony",
    "applejuice",
    "argon",
    "arsenic",
    "astralsorcery.liquidstarlight",
    "barium",
    "bas",
    "battery_alloy",
    "bef2",
    "benzene",
    "berkelium_247",
    "berkelium_247_fluoride",
    "berkelium_247_fluoride_flibe",
    "berkelium_248",
    "berkelium_248_fluoride",
    "berkelium_248_fluoride_flibe",
    "beryllium",
    "bio.ethanol",
    "bio_diesel",
    "biodiesel",
    "biomass",
    "bismuth",
    "bismuth_bronze",
    "bisphenol_a",
    "black_bronze",
    "black_steel",
    "blaze",
    "blood",
    "blue_steel",
    "blue_vitriol_water_solution",
    "boiling_beetroot_soup",
    "boiling_potato_juice",
    "boiling_wormwood",
    "boiling_wort",
    "borax_solution",
    "boric_acid",
    "boron",
    "boron10",
    "boron11",
    "boron_nitride_solution",
    "borosilicate_glass",
    "brass",
    "bronze",
    "butadiene",
    "butane",
    "butene",
    "cadmium",
    "caesium",
    "calcium",
    "calcium_acetate",
    "calcium_sulfate_solution",
    "californium_249",
    "californium_249_fluoride",
    "californium_249_fluoride_flibe",
    "californium_250",
    "californium_250_fluoride",
    "californium_250_fluoride_flibe",
    "californium_251",
    "californium_251_fluoride",
    "californium_251_fluoride_flibe",
    "californium_252",
    "californium_252_fluoride",
    "californium_252_fluoride_flibe",
    "carbon",
    "carbon_dioxide",
    "carbon_monoxide",
    "cerium",
    "charcoal_byproducts",
    "chloramine",
    "chlorine",
    "chloroform",
    "chloromethane",
    "chocolate_liquor",
    "chrome",
    "cider",
    "cinderfire_whiskey",
    "cinderfire_wort",
    "coal",
    "cobalt",
    "cobalt_brass",
    "cocoa_butter",
    "concrete",
    "condensate_water",
    "construction_foam",
    "copper",
    "copper_nak",
    "copper_nak_hot",
    "corium",
    "cracked_heavy_fuel",
    "cracked_light_fuel",
    "creosote",
    "cryotheum",
    "cryotheum_nak",
    "cryotheum_nak_hot",
    "cumene",
    "cupronickel",
    "curium_243",
    "curium_243_fluoride",
    "curium_243_fluoride_flibe",
    "curium_245",
    "curium_245_fluoride",
    "curium_245_fluoride_flibe",
    "curium_246",
    "curium_246_fluoride",
    "curium_246_fluoride_flibe",
    "curium_247",
    "curium_247_fluoride",
    "curium_247_fluoride_flibe",
    "damascus_steel",
    "dark_chocolate",
    "darmstadtium",
    "dawnstone",
    "depleted_fuel_hea_242",
    "depleted_fuel_hea_242_fluoride",
    "depleted_fuel_hea_242_fluoride_flibe",
    "depleted_fuel_heb_248",
    "depleted_fuel_heb_248_fluoride",
    "depleted_fuel_heb_248_fluoride_flibe",
    "depleted_fuel_hecf_249",
    "depleted_fuel_hecf_249_fluoride",
    "depleted_fuel_hecf_249_fluoride_flibe",
    "depleted_fuel_hecf_251",
    "depleted_fuel_hecf_251_fluoride",
    "depleted_fuel_hecf_251_fluoride_flibe",
    "depleted_fuel_hecm_243",
    "depleted_fuel_hecm_243_fluoride",
    "depleted_fuel_hecm_243_fluoride_flibe",
    "depleted_fuel_hecm_245",
    "depleted_fuel_hecm_245_fluoride",
    "depleted_fuel_hecm_245_fluoride_flibe",
    "depleted_fuel_hecm_247",
    "depleted_fuel_hecm_247_fluoride",
    "depleted_fuel_hecm_247_fluoride_flibe",
    "depleted_fuel_hen_236",
    "depleted_fuel_hen_236_fluoride",
    "depleted_fuel_hen_236_fluoride_flibe",
    "depleted_fuel_hep_239",
    "depleted_fuel_hep_239_fluoride",
    "depleted_fuel_hep_239_fluoride_flibe",
    "depleted_fuel_hep_241",
    "depleted_fuel_hep_241_fluoride",
    "depleted_fuel_hep_241_fluoride_flibe",
    "depleted_fuel_heu_233",
    "depleted_fuel_heu_233_fluoride",
    "depleted_fuel_heu_233_fluoride_flibe",
    "depleted_fuel_heu_235",
    "depleted_fuel_heu_235_fluoride",
    "depleted_fuel_heu_235_fluoride_flibe",
    "depleted_fuel_lea_242",
    "depleted_fuel_lea_242_fluoride",
    "depleted_fuel_lea_242_fluoride_flibe",
    "depleted_fuel_leb_248",
    "depleted_fuel_leb_248_fluoride",
    "depleted_fuel_leb_248_fluoride_flibe",
    "depleted_fuel_lecf_249",
    "depleted_fuel_lecf_249_fluoride",
    "depleted_fuel_lecf_249_fluoride_flibe",
    "depleted_fuel_lecf_251",
    "depleted_fuel_lecf_251_fluoride",
    "depleted_fuel_lecf_251_fluoride_flibe",
    "depleted_fuel_lecm_243",
    "depleted_fuel_lecm_243_fluoride",
    "depleted_fuel_lecm_243_fluoride_flibe",
    "depleted_fuel_lecm_245",
    "depleted_fuel_lecm_245_fluoride",
    "depleted_fuel_lecm_245_fluoride_flibe",
    "depleted_fuel_lecm_247",
    "depleted_fuel_lecm_247_fluoride",
    "depleted_fuel_lecm_247_fluoride_flibe",
    "depleted_fuel_len_236",
    "depleted_fuel_len_236_fluoride",
    "depleted_fuel_len_236_fluoride_flibe",
    "depleted_fuel_lep_239",
    "depleted_fuel_lep_239_fluoride",
    "depleted_fuel_lep_239_fluoride_flibe",
    "depleted_fuel_lep_241",
    "depleted_fuel_lep_241_fluoride",
    "depleted_fuel_lep_241_fluoride_flibe",
    "depleted_fuel_leu_233",
    "depleted_fuel_leu_233_fluoride",
    "depleted_fuel_leu_233_fluoride_flibe",
    "depleted_fuel_leu_235",
    "depleted_fuel_leu_235_fluoride",
    "depleted_fuel_leu_235_fluoride_flibe",
    "depleted_fuel_tbu",
    "depleted_fuel_tbu_fluoride",
    "depleted_fuel_tbu_fluoride_flibe",
    "deuterium",
    "diamond",
    "diamond_nak",
    "diamond_nak_hot",
    "diborane",
    "dichlorobenzene",
    "diesel",
    "diluted_hydrochloric_acid",
    "diluted_sulfuric_acid",
    "dimethylamine",
    "dimethyldichlorosilane",
    "dimethylhidrazine",
    "dinitrogen_tetroxide",
    "dist_water",
    "distilled_water",
    "drilling_fluid",
    "duranium",
    "dwarven_ale",
    "dysprosium",
    "electrum",
    "emerald",
    "emerald_nak",
    "emerald_nak_hot",
    "ender",
    "ender_nak",
    "ender_nak_hot",
    "epichlorhydrin",
    "epoxid",
    "erbium",
    "ethane",
    "ethanol",
    "ethene",
    "ethenone",
    "ethylene",
    "europium",
    "exhaust_steam",
    "fermented_biomass",
    "ferroboron",
    "fish_oil",
    "flibe",
    "fluorine",
    "fluorite_water",
    "fluoromethane",
    "flux_goo",
    "for.honey",
    "fuel",
    "fuel_hea_242",
    "fuel_hea_242_fluoride",
    "fuel_hea_242_fluoride_flibe",
    "fuel_heb_248",
    "fuel_heb_248_fluoride",
    "fuel_heb_248_fluoride_flibe",
    "fuel_hecf_249",
    "fuel_hecf_249_fluoride",
    "fuel_hecf_249_fluoride_flibe",
    "fuel_hecf_251",
    "fuel_hecf_251_fluoride",
    "fuel_hecf_251_fluoride_flibe",
    "fuel_hecm_243",
    "fuel_hecm_243_fluoride",
    "fuel_hecm_243_fluoride_flibe",
    "fuel_hecm_245",
    "fuel_hecm_245_fluoride",
    "fuel_hecm_245_fluoride_flibe",
    "fuel_hecm_247",
    "fuel_hecm_247_fluoride",
    "fuel_hecm_247_fluoride_flibe",
    "fuel_hen_236",
    "fuel_hen_236_fluoride",
    "fuel_hen_236_fluoride_flibe",
    "fuel_hep_239",
    "fuel_hep_239_fluoride",
    "fuel_hep_239_fluoride_flibe",
    "fuel_hep_241",
    "fuel_hep_241_fluoride",
    "fuel_hep_241_fluoride_flibe",
    "fuel_heu_233",
    "fuel_heu_233_fluoride",
    "fuel_heu_233_fluoride_flibe",
    "fuel_heu_235",
    "fuel_heu_235_fluoride",
    "fuel_heu_235_fluoride_flibe",
    "fuel_lea_242",
    "fuel_lea_242_fluoride",
    "fuel_lea_242_fluoride_flibe",
    "fuel_leb_248",
    "fuel_leb_248_fluoride",
    "fuel_leb_248_fluoride_flibe",
    "fuel_lecf_249",
    "fuel_lecf_249_fluoride",
    "fuel_lecf_249_fluoride_flibe",
    "fuel_lecf_251",
    "fuel_lecf_251_fluoride",
    "fuel_lecf_251_fluoride_flibe",
    "fuel_lecm_243",
    "fuel_lecm_243_fluoride",
    "fuel_lecm_243_fluoride_flibe",
    "fuel_lecm_245",
    "fuel_lecm_245_fluoride",
    "fuel_lecm_245_fluoride_flibe",
    "fuel_lecm_247",
    "fuel_lecm_247_fluoride",
    "fuel_lecm_247_fluoride_flibe",
    "fuel_len_236",
    "fuel_len_236_fluoride",
    "fuel_len_236_fluoride_flibe",
    "fuel_lep_239",
    "fuel_lep_239_fluoride",
    "fuel_lep_239_fluoride_flibe",
    "fuel_lep_241",
    "fuel_lep_241_fluoride",
    "fuel_lep_241_fluoride_flibe",
    "fuel_leu_233",
    "fuel_leu_233_fluoride",
    "fuel_leu_233_fluoride_flibe",
    "fuel_leu_235",
    "fuel_leu_235_fluoride",
    "fuel_leu_235_fluoride_flibe",
    "fuel_tbu",
    "fuel_tbu_fluoride",
    "fuel_tbu_fluoride_flibe",
    "gadolinium",
    "gallium",
    "gallium_arsenide",
    "gas",
    "gasoline",
    "gelatin",
    "glass",
    "glowstone",
    "glowstone_nak",
    "glowstone_nak_hot",
    "glue",
    "glycerol",
    "glyceryl",
    "gold",
    "gold_nak",
    "gold_nak_hot",
    "grapejuice",
    "graphene",
    "graphite",
    "hard_carbon",
    "heavy_fuel",
    "helium",
    "helium3",
    "high_pressure_steam",
    "holmium",
    "honey",
    "hot_spring_water",
    "hsse",
    "hssg",
    "hsss",
    "hydrated_gelatin",
    "hydrochloric_acid",
    "hydrocracked_butadiene",
    "hydrocracked_butane",
    "hydrocracked_butene",
    "hydrocracked_ethane",
    "hydrocracked_ethylene",
    "hydrocracked_gas",
    "hydrocracked_heavy_fuel",
    "hydrocracked_light_fuel",
    "hydrocracked_naphtha",
    "hydrocracked_propane",
    "hydrocracked_propene",
    "hydrofluoric_acid",
    "hydrogen",
    "hydrogen_sulfide",
    "hypochlorous_acid",
    "ice",
    "indium",
    "indium_concentrate",
    "indium_gallium_phosphide",
    "inner_fire",
    "invar",
    "iridium",
    "iron",
    "iron_magnetic",
    "iron_nak",
    "iron_nak_hot",
    "ironberryjuice",
    "ironwine",
    "isoprene",
    "juice",
    "kanthal",
    "koh",
    "lanthanum",
    "lapis",
    "lapis_nak",
    "lapis_nak_hot",
    "lava",
    "lead",
    "lead_zinc_solution",
    "lif",
    "light_fuel",
    "liquid_air",
    "liquid_death",
    "liquiddna",
    "liquidhelium",
    "liquidhelium_nak",
    "liquidhelium_nak_hot",
    "lithium",
    "lithium6",
    "lithium7",
    "low_pressure_steam",
    "low_quality_steam",
    "lpg",
    "lubricant",
    "lutetium",
    "magnalium",
    "magnesium",
    "magnesium_nak",
    "magnesium_nak_hot",
    "manganese",
    "manganese_dioxide",
    "marshmallow",
    "mc_guffium239",
    "mead",
    "mercury",
    "methane",
    "methanol",
    "methyl_acetate",
    "milk",
    "milk_chocolate",
    "milk_friesian",
    "milk_goat",
    "milk_holstein",
    "milk_jersey",
    "milk_sheep",
    "molybdenum",
    "mutagen",
    "nak",
    "nak_hot",
    "naoh",
    "napalm",
    "naphtha",
    "naquadah",
    "naquadah_alloy",
    "naquadah_enriched",
    "naquadria",
    "natural_gas",
    "neodymium",
    "neodymium_magnetic",
    "neptunium_236",
    "neptunium_236_fluoride",
    "neptunium_236_fluoride_flibe",
    "neptunium_237",
    "neptunium_237_fluoride",
    "neptunium_237_fluoride_flibe",
    "neutral_matter",
    "neutron",
    "neutronium",
    "nichrome",
    "nickel",
    "nickel_sulfate_water_solution",
    "nickel_zinc_ferrite",
    "niobium",
    "niobium_nitride",
    "niobium_titanium",
    "nitration_mixture",
    "nitric_acid",
    "nitric_oxide",
    "nitro_fuel",
    "nitrogen",
    "nitrogen_dioxide",
    "noble_gases",
    "oil",
    "oil_heavy",
    "oil_light",
    "oil_medium",
    "oliveoil",
    "osmiridium",
    "osmium",
    "oxygen",
    "oxygen_difluoride",
    "palladium",
    "phenol",
    "phosphoric_acid",
    "pig_iron",
    "plantoil",
    "plasma",
    "plasma.argon",
    "plasma.helium",
    "plasma.iron",
    "plasma.nickel",
    "plasma.nitrogen",
    "plasma.oxygen",
    "plastic",
    "platinum",
    "plutonium",
    "plutonium241",
    "plutonium_238",
    "plutonium_238_fluoride",
    "plutonium_238_fluoride_flibe",
    "plutonium_239",
    "plutonium_239_fluoride",
    "plutonium_239_fluoride_flibe",
    "plutonium_241",
    "plutonium_241_fluoride",
    "plutonium_241_fluoride_flibe",
    "plutonium_242",
    "plutonium_242_fluoride",
    "plutonium_242_fluoride_flibe",
    "plutonium_fluoride",
    "plutonium_fluoride_flibe",
    "poison",
    "polycaprolactam",
    "polyphenylene_sulfide",
    "polystyrene",
    "polytetrafluoroethylene",
    "polyvinyl_acetate",
    "polyvinyl_chloride",
    "positive_matter",
    "potassium",
    "potassium_fluoride_solution",
    "potassium_hydroxide_solution",
    "potion",
    "potion.minecraft.awkward",
    "potion.minecraft.fire_resistance",
    "potion.minecraft.harming",
    "potion.minecraft.healing",
    "potion.minecraft.invisibility",
    "potion.minecraft.leaping",
    "potion.minecraft.long_fire_resistance",
    "potion.minecraft.long_invisibility",
    "potion.minecraft.long_leaping",
    "potion.minecraft.long_night_vision",
    "potion.minecraft.long_poison",
    "potion.minecraft.long_regeneration",
    "potion.minecraft.long_slowness",
    "potion.minecraft.long_strength",
    "potion.minecraft.long_swiftness",
    "potion.minecraft.long_water_breathing",
    "potion.minecraft.long_weakness",
    "potion.minecraft.luck",
    "potion.minecraft.mundane",
    "potion.minecraft.night_vision",
    "potion.minecraft.poison",
    "potion.minecraft.regeneration",
    "potion.minecraft.slowness",
    "potion.minecraft.strength",
    "potion.minecraft.strong_harming",
    "potion.minecraft.strong_healing",
    "potion.minecraft.strong_leaping",
    "potion.minecraft.strong_poison",
    "potion.minecraft.strong_regeneration",
    "potion.minecraft.strong_strength",
    "potion.minecraft.strong_swiftness",
    "potion.minecraft.swiftness",
    "potion.minecraft.thick",
    "potion.minecraft.water_breathing",
    "potion.minecraft.weakness",
    "praseodymium",
    "preheated_water",
    "promethium",
    "propane",
    "propene",
    "protein",
    "purifying_fluid",
    "quartz",
    "quartz_nak",
    "quartz_nak_hot",
    "radaway",
    "radaway_slow",
    "radon",
    "raw_growth_medium",
    "red_alloy",
    "red_steel",
    "redstone",
    "redstone_nak",
    "redstone_nak_hot",
    "reinforced_epoxy_resin",
    "rocket_fuel",
    "rose_gold",
    "rubber",
    "rubidium",
    "salt_water",
    "samarium",
    "sand",
    "scandium",
    "seed.oil",
    "shimmerdew_spirits",
    "shimmerdew_wort",
    "short.mead",
    "sic_vapor",
    "silicon",
    "silicon_rubber",
    "silicone",
    "silver",
    "slop",
    "snowpoff",
    "sodium",
    "sodium_fluoride_solution",
    "sodium_hydroxide_solution",
    "sodium_persulfate",
    "soldering_alloy",
    "stainless_steel",
    "steam",
    "steamcracked_butadiene",
    "steamcracked_butane",
    "steamcracked_butene",
    "steamcracked_ethane",
    "steamcracked_ethylene",
    "steamcracked_gas",
    "steamcracked_naphtha",
    "steamcracked_propane",
    "steamcracked_propene",
    "steel",
    "steel_magnetic",
    "sterilized_growth_medium",
    "sterling_silver",
    "strontium",
    "styrene",
    "styrene_butadiene_rubber",
    "sugar",
    "sulfur",
    "sulfur_dioxide",
    "sulfur_trioxide",
    "sulfuric_acid",
    "sulfuric_gas",
    "sulfuric_heavy_fuel",
    "sulfuric_light_fuel",
    "sulfuric_naphtha",
    "tantalum",
    "tellurium",
    "terbium",
    "tetrafluoroethylene",
    "tetranitromethane",
    "thorium",
    "thorium_230",
    "thorium_230_fluoride",
    "thorium_230_fluoride_flibe",
    "thorium_232",
    "thorium_232_fluoride",
    "thorium_232_fluoride_flibe",
    "thorium_fluoride",
    "thorium_fluoride_flibe",
    "thulium",
    "tin",
    "tin_alloy",
    "tin_nak",
    "tin_nak_hot",
    "titanium",
    "titanium_tetrachloride",
    "toluene",
    "tough",
    "tritanium",
    "tritium",
    "tungsten",
    "tungsten_carbide",
    "tungsten_steel",
    "ultimet",
    "umber_ale",
    "unsweetened_chocolate",
    "uranium",
    "uranium235",
    "uranium_233",
    "uranium_233_fluoride",
    "uranium_233_fluoride_flibe",
    "uranium_235",
    "uranium_235_fluoride",
    "uranium_235_fluoride_flibe",
    "uranium_238",
    "uranium_238_fluoride",
    "uranium_238_fluoride_flibe",
    "uranium_fluoride",
    "uranium_fluoride_flibe",
    "uuamplifier",
    "uumatter",
    "vanadium",
    "vanadium_gallium",
    "vanadium_steel",
    "vinyl_acetate",
    "vinyl_chloride",
    "viscous_brew",
    "viscous_wort",
    "vodka",
    "water",
    "wildberryjuice",
    "wildberrywine",
    "wine",
    "wood_gas",
    "wood_tar",
    "wood_vinegar",
    "wrought_iron",
    "ytterbium",
    "yttrium",
    "yttrium_barium_cuprate",
    "zinc"
] as string[];

for fluid in fluids {
    mods.jei.JEI.hide(<gregtech:meta_item_1:32406>.withTag({Fluid: {FluidName: fluid, Amount: 256000}}));
    mods.jei.JEI.hide(<gregtech:meta_item_1:32405>.withTag({Fluid: {FluidName: fluid, Amount: 64000}}));
    mods.jei.JEI.hide(<gregtech:meta_item_1:32762>.withTag({Fluid: {FluidName: fluid, Amount: 1000}}));
    mods.jei.JEI.hide(<forestry:can:1>.withTag({Fluid: {FluidName: fluid, Amount: 1000}}));
    mods.jei.JEI.hide(<forestry:capsule:1>.withTag({Fluid: {FluidName: fluid, Amount: 1000}}));
    mods.jei.JEI.hide(<forestry:refractory:1>.withTag({Fluid: {FluidName: fluid, Amount: 1000}}));
    mods.jei.JEI.hide(<extracells:pattern.fluid>.withTag({Fluid: {FluidName: fluid, Amount: 1000}}));
}

mods.jei.JEI.hide(<gregtech:meta_item_1:16003>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17003>);
mods.jei.JEI.hide(<gregtech:meta_item_1:19016>);
mods.jei.JEI.hide(<gregtech:meta_item_1:13018>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16018>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17018>);
mods.jei.JEI.hide(<gregtech:meta_item_1:14022>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12021>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16026>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17026>);
mods.jei.JEI.hide(<gregtech:meta_item_1:18032>);
mods.jei.JEI.hide(<gregtech:meta_item_1:13033>);
mods.jei.JEI.hide(<gregtech:meta_item_1:19033>);
mods.jei.JEI.hide(<gregtech:meta_item_1:13035>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16035>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17035>);
mods.jei.JEI.hide(<gregtech:meta_item_1:19035>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12036>);
mods.jei.JEI.hide(<gregtech:meta_item_1:37>);
mods.jei.JEI.hide(<gregtech:meta_item_1:1037>);
mods.jei.JEI.hide(<gregtech:meta_item_1:2037>);
mods.jei.JEI.hide(<gregtech:meta_item_1:9037>);
mods.jei.JEI.hide(<gregtech:meta_item_1:10037>);
mods.jei.JEI.hide(<gregtech:meta_item_1:11037>);
mods.jei.JEI.hide(<gregtech:meta_item_1:43>);
mods.jei.JEI.hide(<gregtech:meta_item_1:1043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:2043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:9043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:10043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:14043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:18043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:19043>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12045>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16051>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17051>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12052>);
mods.jei.JEI.hide(<gregtech:meta_item_1:14052>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16052>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17052>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16053>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17053>);
mods.jei.JEI.hide(<gregtech:meta_item_1:54>);
mods.jei.JEI.hide(<gregtech:meta_item_1:1054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:2054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:9054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:10054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:14054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17054>);
mods.jei.JEI.hide(<gregtech:meta_item_1:55>);
mods.jei.JEI.hide(<gregtech:meta_item_1:1055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:2055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:9055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:10055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:14055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17055>);
mods.jei.JEI.hide(<gregtech:meta_item_1:56>);
mods.jei.JEI.hide(<gregtech:meta_item_1:1056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:2056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:9056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:10056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:12056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:14056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:16056>);
mods.jei.JEI.hide(<gregtech:meta_item_1:17056>);
mods.jei.JEI.hide(<gtadditions:ga_meta_item:7>);


