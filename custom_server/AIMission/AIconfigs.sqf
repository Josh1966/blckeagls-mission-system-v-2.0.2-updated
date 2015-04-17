/*
AI Mission Compiled by blckeagls @ Zombieville.net
Code was modified by blckeagls using other peoples code.  Been over a year, don't have their names anymore.  Sorry =(
Further modified by Ghostrider - 
This file contains most constants that define the behavior and loot for mission system 
*/
//Variables to Edit Below
	
	blck_debugON = false;

	//Minimum distance for AI To spawn away form another AI
	MinDistanceFromMission = 1000;
	// list of locations that are protected against mission spawns
	blck_locationBlackList = [
		//Add location as [xpos,ypos,0],minimumDistance],
		// Note that there should not be a comma after the last item in this table
		[[0,0,0],0]
	];
	
	// if true then missions will not spawn within 1000 m of spawn points for altis or stratis. 
	blck_blacklistSpawns = true;
	
	//This defines the minimum number of AI to spawn per mission
	blck_MinAI_Major = 20;
	blck_MinAI_Major2 = 16;
	blck_MinAI_Minor = 8;
	blck_MinAI_Minor2 = 12;
	
	//This defines the maximum number of AI to spawn per mission
	blck_MaxAI_Major = 25;
	blck_MaxAI_Major2 = 21;
	blck_MaxAI_Minor = 12;
	blck_MaxAI_Minor2 = 15;
	
	blck_AIGrps_Major = 5;
	blck_AIGrps_Major2 = 4;
	blck_AIGrps_Minor = 2;
	blck_AIGrps_Minor2 = 3;
	
	//This defines how long after an AI dies that it's body disappears.
	blck_aiCleanUpTimer = 900; // in seconds
	
	// Time the marker remains after completing the mission in seconds - experimental not yet implemented
	blck_MarkerPeristTime = 120;

	// Reduce to 1 sec for immediate spawns, or longer if you wish to space the missions out	
	// These are setup for quick spawns and respawns	
	//Minimum Spawn time between missions in seconds
	
		blck_TMin_Major = 250;
		blck_TMin_Major2 = 200;
		blck_TMin_Minor = 120;
		blck_TMin_Minor2 = 150;
	
		//Maximum Spawn time between missions in seconds
		blck_TMax_Major = 360;
		blck_TMax_Major2 = 300;
		blck_TMax_Minor = 200;
		blck_TMax_Minor2 = 250;
	
		// spawn timers now run for each mission type using parameters specific for that type
		//blck_AISpawnTime = 60; //Time in seconds
	
		//Defines how many AI Vehicles or static weapons () to spawn. Set this to -1 to disable spawning of static weapons or vehicles
		blck_SpawnVeh_Major = 3; 
		blck_SpawnVeh_Major2 = 2; 
		blck_SpawnVeh_Minor = -1;
		blck_SpawnVeh_Minor2 = 1; 

	blck_useStatic = true;
	blck_staticWeapons = ["B_HMG_01_high_F","B_GMG_01_high_F"];  // [0.50 cal, grenade launcher]
	
	// Ghost
	// Determines whether a penalty is applied when AI is run over. Experimental. Keep set to false
	blck_RunGear = false;
	
	// Range within which player locations will be revealed to AI after each AI killer set to -1 to disable
	blck_AIAlertDistance = [100,150,225,300];
	blck_AIIntelligence = [0, 0.5, 2, 4];  // experimental - unused at present
	
	blck_useLaunchers = true;
	//blck_launcherTypes = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
	blck_launcherTypes = ["launch_RPG32_F"];
	blck_launchersPerGroup = 1;
	blck_launcherCleanup = true;
	
	//Define loot for crates
	blck_lootCountsMajor = [8,18,10,22,1]; // values are: number of things from the weapons, magazines, items and backpacks arrays to add, respectively.
	blck_BoxLoot_Major = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
		[  
			[// Weapons
				// loaded by a distinct subroutine that looks for the weapon name and magazine type
				["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH",		"5Rnd_127x108_Mag"],
				["m107Tan_EPOCH",	"5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]
			
			],
			[//Magazines
				["CinderBlocks",5,15],
				["jerrycan_epoch",1,2],
				["lighter_epoch",1,1],
				["CircuitParts",2,3],
				["WoodLog_EPOCH",10,20],
				["ItemCorrugatedLg",1,6],
				["ItemCorrugated",3,6],
				["ItemMixOil",1,2],
				["MortarBucket",5,10],
				["PartPlankPack",10,12],
				["ItemLockbox",1,2],
				["3rnd_HE_Grenade_Shell",3,6],
				["EnergyPackLg",1,3],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,10],
				["20Rnd_762x51_Mag",7,14],
				["10Rnd_762x51_Mag",3,10],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,4],
				["EnergyPack",2,5],
				["20Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,6] // Marksman Pack Ammo
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_base",1,3],["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_base",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[//Items
				["Heal_EPOCH",1,2],["Defib_EPOCH",1,2],["Repair_EPOCH",1,4],["FAK",1,4],["VehicleRepair",1,3],["Rangefinder",1,3],
				["ItemKiloHemp",1,2],["ItemRuby",1,2],["ItemSilverBar",1,2],["ItemGoldBar10oz",1,2],
				["ItemSodaRbull",1,3],["ItemSodaOrangeSherbet",1,3],["ItemSodaPurple",1,3],["ItemSodaMocha",1,3],["ItemSodaBurst",1,3],
				["CookedChicken_EPOCH",1,3],["CookedGoat_EPOCH",1,3],["CookedSheep_EPOCH",1,3],["FoodSnooter",1,3],["FoodMeeps",1,3],["FoodBioMeat",1,3],["ItemTuna",1,3],["ItemSeaBass",1,3],["ItemTrout",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_ocamo",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],["B_FieldPack_blk",1,2],
				["B_FieldPack_cbr",1,2],["B_FieldPack_khk",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oli",1,2],["B_FieldPack_oucamo",1,2],["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],
				["B_Kitbag_rgr",1,2],["B_Kitbag_sgg",1,2],["B_Parachute",1,2],["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],
				["B_TacticalPack_rgr",1,2],["smallbackpack_red_epoch",1,2],["smallbackpack_green_epoch",1,2],["smallbackpack_teal_epoch",1,2],["smallbackpack_pink_epoch",1,2]
			]
	];		
	
	blck_lootCountsMajor2 = [7,16,8,18,1];	
	blck_BoxesLoot_Major2 = 
		[
			[// Weapons
				// Format is ["Weapon Name","Magazine Name"],
				["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH",		"5Rnd_127x108_Mag"],
				["m107Tan_EPOCH",	"5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]			
			],
			[//Magazines
				// Format is ["Magazine name, Minimum number to add, Maximum number to add],
				["CinderBlocks",4,12],
				["jerrycan_epoch",1,2],
				["lighter_epoch",1,1],
				["CircuitParts",2,5],
				["WoodLog_EPOCH",10,20],
				["ItemCorrugatedLg",1,3],
				["ItemCorrugated",2,6],
				["ItemMixOil",1,2],
				["MortarBucket",3,6],
				["PartPlankPack",10,12],
				["ItemLockbox",1,2],
				["3rnd_HE_Grenade_Shell",2,4],
				["EnergyPackLg",1,2],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,8],
				["20Rnd_762x51_Mag",3,11],
				["10Rnd_762x51_Mag",3,8],
				["20Rnd_762x51_Mag",3,11],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,3],
				["EnergyPack",2,5],
				["20Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,6] // Marksman Pack Ammo				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_base",1,3],["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_base",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],			
			[//Items
				// Format is ["Item name, Minimum number to add, Maximum number to add],
				["Heal_EPOCH",1,2],["Defib_EPOCH",1,2],["Repair_EPOCH",1,2],["FAK",1,2],["VehicleRepair",1,3],["Rangefinder",1,3],
				["ItemKiloHemp",1,2],["ItemRuby",1,2],["ItemSilverBar",1,2],["ItemGoldBar10oz",1,2],
				["ItemSodaRbull",1,3],["ItemSodaOrangeSherbet",1,3],["ItemSodaPurple",1,3],["ItemSodaMocha",1,3],["ItemSodaBurst",1,3],
				["CookedChicken_EPOCH",1,3],["CookedGoat_EPOCH",1,3],["CookedSheep_EPOCH",1,3],["FoodSnooter",1,3],["FoodMeeps",1,3],["FoodBioMeat",1,3],["ItemTuna",1,3],["ItemSeaBass",1,3],["ItemTrout",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",1,2],["B_AssaultPack_khk",1,2],["B_AssaultPack_mcamo",1,2],["B_AssaultPack_ocamo",1,2],["B_AssaultPack_rgr",1,2],["B_AssaultPack_sgg",1,2],
				["B_Carryall_cbr",1,2],["B_Carryall_khk",1,2],["B_Carryall_mcamo",1,2],["B_Carryall_ocamo",1,2],["B_Carryall_oli",1,2],["B_Carryall_oucamo",1,2],["B_FieldPack_blk",1,2],
				["B_FieldPack_cbr",1,2],["B_FieldPack_khk",1,2],["B_FieldPack_ocamo",1,2],["B_FieldPack_oli",1,2],["B_FieldPack_oucamo",1,2],["B_Kitbag_cbr",1,2],["B_Kitbag_mcamo",1,2],
				["B_Kitbag_rgr",1,2],["B_Kitbag_sgg",1,2],["B_Parachute",1,2],["B_TacticalPack_blk",1,2],["B_TacticalPack_mcamo",1,2],["B_TacticalPack_ocamo",1,2],["B_TacticalPack_oli",1,2],
				["B_TacticalPack_rgr",1,2],["smallbackpack_red_epoch",1,2],["smallbackpack_green_epoch",1,2],["smallbackpack_teal_epoch",1,2],["smallbackpack_pink_epoch",1,2]
			]
		];
		
	blck_lootCountsMinor = [5,14,5,8,1];			
	blck_BoxesLoot_Minor = 
		[
			[// Weapons
								["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH",		"5Rnd_127x108_Mag"],
				["m107Tan_EPOCH",	"5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]			
			],
			[//Magazines
				["CinderBlocks",2,6],
				["jerrycan_epoch",1,2],
				["lighter_epoch",1,1],
				["CircuitParts",2,3],
				["WoodLog_EPOCH",10,20],
				["ItemCorrugatedLg",0,4],
				["ItemCorrugated",1,4],
				["ItemMixOil",1,2],
				["MortarBucket",1,8],
				["PartPlankPack",10,12],
				["ItemLockbox",1,2],
				["3rnd_HE_Grenade_Shell",1,2],
				["EnergyPackLg",0,1],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,6],
				["20Rnd_762x51_Mag",3,9],
				["10Rnd_762x51_Mag",3,6],
				["20Rnd_762x51_Mag",3,9],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,4],
				["HandGrenade",1,3],
				["EnergyPack",2,5],
				["20Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,6] // Marksman Pack Ammo				
			],	
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_base",1,3],["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_base",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],
			[//Items
				["Heal_EPOCH",1,2],["Defib_EPOCH",1,2],["Repair_EPOCH",1,2],["FAK",1,5],["VehicleRepair",1,5],
				["ItemSodaRbull",1,3],["ItemSodaOrangeSherbet",1,3],["ItemSodaPurple",1,3],["ItemSodaMocha",1,3],["ItemSodaBurst",1,3],
				["CookedChicken_EPOCH",1,3],["CookedGoat_EPOCH",1,3],["CookedSheep_EPOCH",1,3],["FoodSnooter",1,3],["FoodMeeps",1,3],["FoodBioMeat",1,3],["ItemTuna",1,3],["ItemSeaBass",1,3],["ItemTrout",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",0,2],["B_AssaultPack_khk",0,2],["B_AssaultPack_mcamo",0,2],["B_AssaultPack_ocamo",0,2],["B_AssaultPack_rgr",0,2],["B_AssaultPack_sgg",0,2],
				["B_Carryall_cbr",0,2],["B_Carryall_khk",0,2],["B_Carryall_mcamo",0,2],["B_Carryall_ocamo",0,2],["B_Carryall_oli",0,2],["B_Carryall_oucamo",0,2],["B_FieldPack_blk",0,2],
				["B_FieldPack_cbr",0,2],["B_FieldPack_khk",0,2],["B_FieldPack_ocamo",0,2],["B_FieldPack_oli",0,2],["B_FieldPack_oucamo",0,2],["B_Kitbag_cbr",0,2],["B_Kitbag_mcamo",0,2],
				["B_Kitbag_rgr",0,2],["B_Kitbag_sgg",0,2],["B_Parachute",0,2],["B_TacticalPack_blk",0,2],["B_TacticalPack_mcamo",0,2],["B_TacticalPack_ocamo",0,2],["B_TacticalPack_oli",0,2],
				["B_TacticalPack_rgr",0,2],["smallbackpack_red_epoch",0,2],["smallbackpack_green_epoch",0,2],["smallbackpack_teal_epoch",0,2],["smallbackpack_pink_epoch",0,2]
			]
		];
	
	blck_lootCountsMinor2 = [6,16,6,8,1];
	blck_BoxesLoot_Minor2 = 
		[	
			[// Weapons
								["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH",		"5Rnd_127x108_Mag"],
				["m107Tan_EPOCH",	"5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]				
			],
			[//Magazines
				["CinderBlocks",2,7],
				["jerrycan_epoch",1,2],
				["lighter_epoch",1,1],
				["CircuitParts",2,6],
				["WoodLog_EPOCH",10,20],
				["ItemCorrugatedLg",0,5],
				["ItemCorrugated",1,6],
				["ItemMixOil",1,2],
				["MortarBucket",2,5],
				["PartPlankPack",10,12],
				["ItemLockbox",1,2],
				["3rnd_HE_Grenade_Shell",1,5],
				["EnergyPackLg",0,1],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,6],
				["20Rnd_762x51_Mag",3,10],
				["10Rnd_762x51_Mag",3,6],
				["20Rnd_762x51_Mag",3,10],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,2],
				["HandGrenade",1,3],
				["EnergyPack",2,5],
				["20Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,6] // Marksman Pack Ammo				
			],		
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_base",1,3],["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_base",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
			],			
			[//Items
				["Heal_EPOCH",1,2],["Defib_EPOCH",1,2],["Repair_EPOCH",1,2],["FAK",1,2],["VehicleRepair",1,3],
				["ItemSodaRbull",1,3],["ItemSodaOrangeSherbet",1,3],["ItemSodaPurple",1,3],["ItemSodaMocha",1,3],["ItemSodaBurst",1,3],
				["CookedChicken_EPOCH",1,3],["CookedGoat_EPOCH",1,3],["CookedSheep_EPOCH",1,3],["FoodSnooter",1,3],["FoodMeeps",1,3],["FoodBioMeat",1,3],["ItemTuna",1,3],["ItemSeaBass",1,3],["ItemTrout",1,3]
			],
			[ // Backpacks
				["B_AssaultPack_dgtl",0,2],["B_AssaultPack_khk",0,2],["B_AssaultPack_mcamo",0,2],["B_AssaultPack_ocamo",0,2],["B_AssaultPack_rgr",0,2],["B_AssaultPack_sgg",0,2],
				["B_Carryall_cbr",0,2],["B_Carryall_khk",0,2],["B_Carryall_mcamo",0,2],["B_Carryall_ocamo",0,2],["B_Carryall_oli",0,2],["B_Carryall_oucamo",0,2],["B_FieldPack_blk",0,2],
				["B_FieldPack_cbr",0,2],["B_FieldPack_khk",0,2],["B_FieldPack_ocamo",0,2],["B_FieldPack_oli",0,2],["B_FieldPack_oucamo",0,2],["B_Kitbag_cbr",0,2],["B_Kitbag_mcamo",0,2],
				["B_Kitbag_rgr",0,2],["B_Kitbag_sgg",0,2],["B_Parachute",0,2],["B_TacticalPack_blk",0,2],["B_TacticalPack_mcamo",0,2],["B_TacticalPack_ocamo",0,2],["B_TacticalPack_oli",0,2],
				["B_TacticalPack_rgr",0,2],["smallbackpack_red_epoch",0,2],["smallbackpack_green_epoch",0,2],["smallbackpack_teal_epoch",0,2],["smallbackpack_pink_epoch",0,2]
			]
		];
		
	//This defines the random weapon to spawn on the AI
	blck_WeaponList_Orange = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
		//["WEAPON","MAGAZINE"]
				["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH",		"5Rnd_127x108_Mag"],
				["m107Tan_EPOCH",	"5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]				
		];
	blck_WeaponList_Green = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
		//["WEAPON","MAGAZINE"]
				["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH",		"5Rnd_127x108_Mag"],
				["m107Tan_EPOCH",	"5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]			
		];
	blck_WeaponList_Blue = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
		//["WEAPON","MAGAZINE"]
				["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F",	"30Rnd_65x39_caseless_mag_Tracer"],				
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]
		];
	blck_WeaponList_Red = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
		//["WEAPON","MAGAZINE"]
				["MultiGun","EnergyPackLg"],
				["arifle_Katiba_F","30Rnd_65x39_caseless_green"],
				["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],
				["arifle_Mk20_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_plain_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20C_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_F","30Rnd_556x45_Stanag"],
				["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag"],
				["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_SW_Black_Hamr_pointer_F","100Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXC_F","30Rnd_65x39_caseless_mag"],
				["arifle_MXM_F","30Rnd_65x39_caseless_mag"],
				["arifle_SDAR_F","20Rnd_556x45_UW_mag"],
				["arifle_TRG20_F","30Rnd_556x45_Stanag"],
				["m16_EPOCH","30Rnd_556x45_Stanag"],
				["m16Red_EPOCH","30Rnd_556x45_Stanag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],
				["m4a3_EPOCH","30Rnd_556x45_Stanag"],
				["SMG_02_F",		"30Rnd_9x21_Mag"],
				["SMG_01_F",		"30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F",	"30Rnd_9x21_Mag"],
				["M14_EPOCH",			"20Rnd_762x51_Mag"],
				["M14Grn_EPOCH",		"20Rnd_762x51_Mag"],				
				["arifle_MXM_F",		"30Rnd_65x39_caseless_mag_Tracer"],
				["m249_EPOCH",				"200Rnd_556x45_M249"],
				["m249Tan_EPOCH",			"200Rnd_556x45_M249"],
				["LMG_Mk200_F",				"200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F",			"100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F",	"100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F",				"150Rnd_762x51_Box_Tracer"]
		];
		
		
	blck_AIItemList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
				//["ITME","COUNT"]
				["HandGrenade",3],
				["FAK",2]
		];
		
	//This defines the skin list
	blck_SkinList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
				"U_AntigonaBody",
				"U_AttisBody",
				"U_B_CombatUniform_mcam",
				"U_B_CombatUniform_mcam_tshirt",
				"U_B_CombatUniform_mcam_vest",
				"U_B_CombatUniform_mcam_worn",
				"U_B_CombatUniform_sgg",
				"U_B_CombatUniform_sgg_tshirt",
				"U_B_CombatUniform_sgg_vest",
				"U_B_CombatUniform_wdl",
				"U_B_CombatUniform_wdl_tshirt",
				"U_B_CombatUniform_wdl_vest",
				"U_B_CTRG_1",
				"U_B_CTRG_2",
				"U_B_CTRG_3",
				"U_B_GhillieSuit",
				"U_B_HeliPilotCoveralls",
				"U_B_PilotCoveralls",
				"U_B_SpecopsUniform_sgg",
				"U_B_survival_uniform",
				"U_B_Wetsuit",
				"U_BasicBody",
				"U_BG_Guerilla1_1",
				"U_BG_Guerilla2_1",
				"U_BG_Guerilla2_2",
				"U_BG_Guerilla2_3",
				"U_BG_Guerilla3_1",
				"U_BG_Guerilla3_2",
				"U_BG_leader",
				"U_C_Commoner_shorts",
				"U_C_Commoner1_1",
				"U_C_Commoner1_2",
				"U_C_Commoner1_3",
				"U_C_Commoner2_1",
				"U_C_Commoner2_2",
				"U_C_Commoner2_3",
				"U_C_Farmer",
				"U_C_Fisherman",
				"U_C_FishermanOveralls",
				"U_C_HunterBody_brn",
				"U_C_HunterBody_grn",
				"U_C_Journalist",
				"U_C_Novak",
				"U_C_Poloshirt_blue",
				"U_C_Poloshirt_burgundy",
				"U_C_Poloshirt_redwhite",
				"U_C_Poloshirt_salmon",
				"U_C_Poloshirt_stripped",
				"U_C_Poloshirt_tricolour",
				"U_C_Poor_1",
				"U_C_Poor_2",
				"U_C_Poor_shorts_1",
				"U_C_Poor_shorts_2",
				"U_C_PriestBody",
				"U_C_Scavenger_1",
				"U_C_Scavenger_2",
				"U_C_Scientist",
				"U_C_ShirtSurfer_shorts",
				"U_C_TeeSurfer_shorts_1",
				"U_C_TeeSurfer_shorts_2",
				"U_C_WorkerCoveralls",
				"U_C_WorkerOveralls",
				"U_Competitor",
				"U_I_CombatUniform",
				"U_I_CombatUniform_shortsleeve",
				"U_I_CombatUniform_tshirt",
				"U_I_G_resistanceLeader_F",
				"U_I_G_Story_Protagonist_F",
				"U_I_GhillieSuit",
				"U_I_HeliPilotCoveralls",
				"U_I_OfficerUniform",
				"U_I_pilotCoveralls",
				"U_I_Wetsuit",
				"U_IG_Guerilla1_1",
				"U_IG_Guerilla2_1",
				"U_IG_Guerilla2_2",
				"U_IG_Guerilla2_3",
				"U_IG_Guerilla3_1",
				"U_IG_Guerilla3_2",
				"U_IG_leader",
				"U_IG_Menelaos",
				"U_KerryBody",
				"U_MillerBody",
				"U_NikosAgedBody",
				"U_NikosBody",
				"U_O_CombatUniform_ocamo",
				"U_O_CombatUniform_oucamo",
				"U_O_GhillieSuit",
				"U_O_OfficerUniform_ocamo",
				"U_O_PilotCoveralls",
				"U_O_SpecopsUniform_blk",
				"U_O_SpecopsUniform_ocamo",
				"U_O_Wetsuit",
				"U_OG_Guerilla1_1",
				"U_OG_Guerilla2_1",
				"U_OG_Guerilla2_2",
				"U_OG_Guerilla2_3",
				"U_OG_Guerilla3_1",
				"U_OG_Guerilla3_2",
				"U_OG_leader",
				"U_OI_Scientist",
				"U_OrestesBody",
				"U_Rangemaster"
			];

	/////////////////////////////////////
	// this variable is used together with skill to determine the degree to which AI killers location is revealed

	blck_SkillsBlue = [
		["aimingAccuracy",0.10],
		["aimingShake",0.20],
		["aimingSpeed",0.20],
		["endurance",0.50],
		["spotDistance",0.40],
		["spotTime",0.50],
		["courage",0.60],
		["reloadSpeed",0.80],
		["commanding",0.8],
		["general",1.00]
	];

	blck_SkillsRed = [
		["aimingAccuracy",0.2],
		["aimingShake",0.3],
		["aimingSpeed",0.35],
		["endurance",0.60],
		["spotDistance",0.4],
		["spotTime",0.6],
		["courage",.70],
		["reloadSpeed",0.70],
		["commanding",0.8],
		["general",1.00]
	];

	blck_SkillsGreen = [
		["aimingAccuracy",0.65],
		["aimingShake",0.45],
		["aimingSpeed",0.6],
		["endurance",0.9],
		["spotDistance",0.6],
		["spotTime",0.8],
		["courage",1],
		["reloadSpeed",0.75],
		["commanding",0.9],
		["general",1.00]
	];

	blck_SkillsOrange = [
		["aimingAccuracy",0.9],
		["aimingShake",0.9],
		["aimingSpeed",0.9],
		["endurance",1.00],
		["spotDistance",0.9],
		["spotTime",1.0],
		["courage",1.00],
		["reloadSpeed",1.00],
		["commanding",1.00],
		["general",1.00]
	];

	blck_combatMode = "RED"; // Change this to "YELLOW" if the AI wander too far from missions for your tastes.
	blck_groupFormation = "WEDGE"; // Possibilities include "WEDGE","VEE","FILE","DIAMOND"

	diag_log "[blckeagls] Configurations Loaded";

	true;