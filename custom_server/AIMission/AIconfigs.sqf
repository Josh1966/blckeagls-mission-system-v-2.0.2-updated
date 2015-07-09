/*
AI Mission Compiled by blckeagls @ Zombieville.net
Code was modified by blckeagls using other peoples code.  Been over a year, don't have their names anymore.  Sorry =(
Further modified by Ghostrider - 
This file contains most constants that define the behavior and loot for mission system 
*/
	/**************************************************************
	
	BLACKLIST LOCATIONS
	
	**************************************************************/
	// if true then missions will not spawn within 1000 m of spawn points for Altis, Bornholm, Cherno, Esseker or stratis. 
	blck_blacklistSpawns = true;
	// list of locations that are protected against mission spawns	
	blck_locationBlackList = [
	//Add location as [xpos,ypos,0],minimumDistance],
	// Note that there should not be a comma after the last item in this table
		[[0,0,0],0]
	];
	
	/***********************************************************
	
	GENERAL MISSION SYSTEM CONFIGURATION
	
	***********************************************************/
	blck_useSmokeAtCrates = true;  // When true, a smoking wreck will be spawned near the loot crate: Note that due to collisions with mission or other objects, the smoke may not always spawn.
	blck_RunGear = true;	// When set to true, AI that have been run over will ve stripped of gear, and the vehicle will be given blck_RunGearDamage of damage.
	blck_RunGearDamage = 0.2;
	blck_VG_Gear = true; // When set to true, AI that have been killed by a player in a vehicle in the list of forbidden vehicles will be stripped of gear and the vehicle will be given blck_RunGearDamage of damage
	blck_VK_RunoverDamage = true; // when the AI was run over blck_RunGearDamage of damage will be applied to the killer's vehicle.
	blck_VK_GunnerDamage = true; // when the AI was killed by a gunner on a vehicle that is is in the list of forbidden vehicles, blck_RunGearDamage of damage will be applied to the killer's vehicle each time an AI is killed with a vehicle's gun.
	blck_useMines = false;   // when true mines are spawned around the mission area. these are cleaned up when a player reaches the crate.
	blck_forbidenVehicles = ["B_MRAP_01_hmg_F","O_MRAP_02_hmg_F"]; // Add any vehicles for which you wish to forbid vehicle kills, or set this = ["LandVehicles"]; to penalize for all AI kills using vehicles	
	// For a listing of the guns mounted on various land vehicles see the following link: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Vehicle_Weapons
	// HMG_M2 is mounted on the armed offroad that is spawned by Epoch	
	blck_forbidenVehicleGuns = ["LMG_RCWS","LMG_M200","HMG_127","HMG_127_APC",/*"HMG_M2",*/"HMG_NSVT","GMG_40mm","GMG_UGV_40mm","autocannon_40mm_CTWS","autocannon_30mm_CTWS","autocannon_35mm","LMG_coax","autocannon_30mm"]; // Add any vehicle-mounted weapons for which you wish to forbid vehicle kills
	blck_useVehiclePatrols = true; // When true vehicles will be spawned at missions and will patrol the mission area.
	blck_killEmptyAIVehicles = true; // when true, the AI vehicle will be extensively damaged once all AI have gotten out.
	blck_useStatic = true;  // When true, AI will man static weapons spawned 20-30 meters from the mission center. These are very effective against most vehicles
	blck_staticWeapons = ["B_HMG_01_high_F","B_GMG_01_high_F"/*,"O_static_AT_F"*/];  // [0.50 cal, grenade launcher, AT Launcher]
	blck_AI_Vehicles = ["I_G_Offroad_01_armed_F","I_G_Offroad_02_armed_F","I_G_Offroad_03_armed_F"]; // Type of vehicle spawned to defend AI bases

	//Defines how many AI Vehicles to spawn. Set this to -1 to disable spawning of static weapons or vehicles. To discourage players runniing with with vehicles, spawn more B_GMG_01_high
	blck_SpawnVeh_Major = 3; // Number of static weapons at Orange Missions
	blck_SpawnVeh_Major2 = 2; // Number of static weapons at Green Missions
	blck_SpawnVeh_Minor = 1;  // Number of static weapons at Blue Missions
	blck_SpawnVeh_Minor2 = 1;  // Number of static weapons at Red Missions

	// Defines how many static weapons to spawn. Set this to -1 to disable spawning 
	blck_SpawnEmplaced_Major = 3; // Number of static weapons at Orange Missions
	blck_SpawnEmplaced_Major2 = 2; // Number of static weapons at Green Missions
	blck_SpawnEmplaced_Minor = 1;  // Number of static weapons at Blue Missions
	blck_SpawnEmplaced_Minor2 = 2;  // Number of static weapons at Red Missions	

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

	/****************************************************************
	
	GENERAL AI SETTINGS
	
	****************************************************************/
	blck_useNVG = true; // When true, AI will be spawned with NVG if is dark
	blck_useLaunchers = false;  // When true, some AI will be spawned with RPGs; they do not however fire on vehicles for some reason so I recommend this be set to false for now
	//blck_launcherTypes = ["launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F","launch_O_Titan_short_F"];
	blck_launcherTypes = ["launch_RPG32_F"];
	blck_launchersPerGroup = 1;  // Defines the number of AI per group spawned with a launcher
	blck_launcherCleanup = true;// When true, launchers and launcher ammo are removed from dead AI.
	blck_combatMode = "RED"; // Change this to "YELLOW" if the AI wander too far from missions for your tastes.
	blck_groupFormation = "WEDGE"; // Possibilities include "WEDGE","VEE","FILE","DIAMOND"
	//This defines how long after an AI dies that it's body disappears.
	blck_bodyCleanUpTimer = 1200; // in seconds
	// Eat time an AI is killed, the location of the killer will be revealed to all AI within this range of the killed AI, set to -1 to disable
	blck_AIAlertDistance = [150,200,250,300];
	// How precisely player locations will be revealed to AI after an AI kill
	blck_AIIntelligence = [0.5, 1, 2, 4];  
	/***************************************************************
	
	MISSION TYPE SPECIFIC AI SETTINGS
	
	**************************************************************/
	//This defines the skill, minimum/Maximum number of AI and how many AI groups are spawned for each mission type
	// Orange Missions
	blck_MinAI_Major = 20;
	blck_MaxAI_Major = 25;
	blck_AIGrps_Major = 5;
	blck_SkillsOrange = [
		["aimingAccuracy",0.3],["aimingShake",0.6],["aimingSpeed",0.5],["endurance",1.00],["spotDistance",1.0],["spotTime",1.0],["courage",1.00],["reloadSpeed",1.00],["commanding",1.00],["general",1.00]
	];
	
	// Green Missions
	blck_MinAI_Major2 = 16;
	blck_MaxAI_Major2 = 21;
	blck_AIGrps_Major2 = 4;
	blck_SkillsGreen = [
		["aimingAccuracy",0.24],["aimingShake",0.5],["aimingSpeed",0.35],["endurance",0.9],["spotDistance",0.6],["spotTime",0.8],["courage",1],["reloadSpeed",0.75],["commanding",0.9],["general",1.00]
	];
	
	// Red Missions
	blck_MinAI_Minor2 = 12;
	blck_MaxAI_Minor2 = 15;
	blck_AIGrps_Minor2 = 3;
	blck_SkillsRed = [
		["aimingAccuracy",0.16],["aimingShake",0.3],["aimingSpeed",0.2],["endurance",0.60],["spotDistance",0.6],["spotTime",0.6],["courage",.70],["reloadSpeed",0.70],["commanding",0.8],["general",1.00]
	];
	
	// Blue Missions
	blck_MinAI_Minor = 8;	
	blck_MaxAI_Minor = 12;
	blck_AIGrps_Minor = 2;
	blck_SkillsBlue = [
		["aimingAccuracy",0.06],["aimingShake",0.10],["aimingSpeed",0.20],["endurance",0.50],["spotDistance",0.40],["spotTime",0.50],["courage",0.60],["reloadSpeed",0.80],["commanding",0.8],["general",1.00]
	];
	
/*********************************************************************************

AI WEAPONS, UNIFORMS, VESTS AND GEAR

**********************************************************************************/
		_RifleSniper = [ 
			"srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","srifle_DMR_01_F","m107Tan_EPOCH","m107_EPOCH","sr25_epoch"			
		];

		_RifleAssault = [
			"arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F","arifle_MXC_F","arifle_MX_F","arifle_MX_GL_F","arifle_MXM_F","arifle_SDAR_F",
			"arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","arifle_Mk20_F","arifle_Mk20C_F","arifle_Mk20_GL_F","arifle_Mk20_plain_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_plain_F",
			"arifle_MXM_Black_F","arifle_MX_GL_Black_F","arifle_MX_Black_F","arifle_MXC_Black_F","arifle_MX_SW_F","arifle_MX_SW_Black_F",
			"m16_EPOCH","m16Red_EPOCH","M14_EPOCH","M14Grn_EPOCH","m4a3_EPOCH","AKM_EPOCH","l85a2_epoch"
		];

		_RifleLMG = [
			"LMG_Mk200_F","LMG_Zafir_F","m249_EPOCH","m249Tan_EPOCH"
		];

		_RifleOther = [
			"SMG_01_F","SMG_02_F","Rollins_F","speargun_epoch"
		];

		_Pistols = [
			"hgun_PDW2000_F","hgun_ACPC2_F","hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","ruger_pistol_epoch","1911_pistol_epoch","hgun_Pistol_Signal_F"
		];	
		
		_DLC_MMG = [
					"MMG_01_hex_F","MMG_02_sand_F","MMG_01_tan_F","MMG_02_black_F","MMG_02_camo_F"
		];
		
		_DLC_Sniper = [
			"srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F"
		];
		
	//This defines the random weapon to spawn on the AI
	//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
	blck_WeaponList_Orange = _RifleSniper + _RifleAssault + _RifleLMG + _DLC_Sniper + _DLC_MMG;
	blck_WeaponList_Green = _RifleSniper + 	_RifleAssault +_RifleLMG + _DLC_MMG;
	blck_WeaponList_Blue = _RifleOther + _RifleAssault +_RifleLMG;
	blck_WeaponList_Red = _RifleOther + _RifleSniper + 	_RifleAssault + _RifleLMG;
		
	//This defines the skin list
	blck_SkinList = [
		//https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
				"U_AntigonaBody",
				"U_AttisBody",
				"U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest","U_B_CombatUniform_mcam_worn","U_B_CombatUniform_sgg","U_B_CombatUniform_sgg_tshirt","U_B_CombatUniform_sgg_vest","U_B_CombatUniform_wdl","U_B_CombatUniform_wdl_tshirt","U_B_CombatUniform_wdl_vest",
				"U_B_CTRG_1","U_B_CTRG_2","U_B_CTRG_3",	
				"U_B_GhillieSuit",
				"U_B_HeliPilotCoveralls","U_B_PilotCoveralls",
				"U_B_SpecopsUniform_sgg",
				"U_B_survival_uniform",
				"U_B_Wetsuit",
				//"U_BasicBody",
				"U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2",
				"U_BG_leader",
				"U_C_Commoner_shorts","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_C_Commoner2_1","U_C_Commoner2_2","U_C_Commoner2_3",
				"U_C_Farmer","U_C_Fisherman","U_C_FishermanOveralls","U_C_HunterBody_brn","U_C_HunterBody_grn",
				"U_C_Journalist",
				"U_C_Novak",
				"U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour",
				"U_C_Poor_1","U_C_Poor_2","U_C_Poor_shorts_1","U_C_Poor_shorts_2","U_C_PriestBody","U_C_Scavenger_1","U_C_Scavenger_2",
				"U_C_Scientist","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2",
				"U_C_WorkerCoveralls","U_C_WorkerOveralls","U_Competitor",
				"U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_I_CombatUniform_tshirt","U_I_G_resistanceLeader_F",
				"U_I_G_Story_Protagonist_F",
				"U_I_GhillieSuit",
				"U_I_HeliPilotCoveralls",
				"U_I_OfficerUniform",
				"U_I_pilotCoveralls",
				"U_I_Wetsuit",
				"U_IG_Guerilla1_1","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2",
				"U_IG_leader",
				"U_IG_Menelaos",
				"U_KerryBody",
				"U_MillerBody",
				"U_NikosAgedBody",
				"U_NikosBody",
				"U_O_CombatUniform_ocamo","U_O_CombatUniform_oucamo",
				"U_O_GhillieSuit",
				"U_O_OfficerUniform_ocamo",
				"U_O_PilotCoveralls",
				"U_O_SpecopsUniform_blk",
				"U_O_SpecopsUniform_ocamo",
				"U_O_Wetsuit",
				"U_OG_Guerilla1_1","U_OG_Guerilla2_1","U_OG_Guerilla2_2","U_OG_Guerilla2_3","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_OG_leader",
				"U_OI_Scientist",
				"U_OrestesBody",
				"U_Rangemaster",
				// DLC
				"U_B_FullGhillie_ard","U_I_FullGhillie_ard","U_O_FullGhillie_ard","U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard","U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh"
			];

	blck_vests = [
				"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH",
				"V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH",
				// DLC Vests
				"V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli"
			];

/***************************************************************************************

CONTENTS OF LOOT CRATES FOR EACH MISSION

***************************************************************************************/			

	// values are: number of things from the weapons, magazines, optics, items and backpacks arrays to add, respectively.
	blck_lootCountsMajor = [8,24,8,12,1];   // Orange
	blck_lootCountsMajor2 = [7,20,6,10,1]; // Green
	blck_lootCountsMinor2 = [6,12,4,6,1];  // Red	
	blck_lootCountsMinor = [5,16,3,8,1];   // Blue

	
	blck_BoxLoot_Major = 
		// Loot is grouped as [weapons],[magazines],[items] in order to be able to use the correct function to load the item into the crate later on.
		// Each item consist of the following information ["ItemName",minNum, maxNum] where min is the smallest number added and min+max is the largest number added.
		
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
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH","5Rnd_127x108_Mag"],
				["m107Tan_EPOCH","5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH","200Rnd_556x45_M249"],
				["m249Tan_EPOCH","200Rnd_556x45_M249"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["MMG_01_tan_F","150Rnd_93x64_Mag"],
				["MMG_02_black_F","150Rnd_93x64_Mag"],
				["MMG_02_camo_F","150Rnd_93x64_Mag"],
				["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_02_F","10Rnd_338_Mag"],
				["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],
				["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],
				["srifle_DMR_05_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"],				
				["srifle_DMR_04_F","10Rnd_127x54_Mag"],
				["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]		
			],
			[//Magazines
				["CinderBlocks",5,15],
				["jerrycan_epoch",1,2],
				["lighter_epoch",0,1],
				["CircuitParts",2,3],
				["WoodLog_EPOCH",5,10],
				["ItemCorrugatedLg",1,6],
				["ItemCorrugated",3,10],
				["ItemMixOil",1,2],
				["MortarBucket",5,10],
				["PartPlankPack",10,12],
				["ItemLockbox",1,2],
				["3rnd_HE_Grenade_Shell",3,6],
				["EnergyPackLg",1,3],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,10],
				["20Rnd_762x51_Mag",7,14],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,4],
				["EnergyPack",2,5],
				// Marksman Pack Ammo
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
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
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH","5Rnd_127x108_Mag"],
				["m107Tan_EPOCH","5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH","200Rnd_556x45_M249"],
				["m249Tan_EPOCH","200Rnd_556x45_M249"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],
				["srifle_DMR_03_F","10Rnd_338_Mag"],		
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_05_hex_F","10Rnd_338_Mag"],	
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"]				
			],
			[//Magazines
				// Format is ["Magazine name, Minimum number to add, Maximum number to add],
				["CinderBlocks",4,12],
				["jerrycan_epoch",1,2],
				["lighter_epoch",1,1],
				["CircuitParts",2,5],
				["WoodLog_EPOCH",10,20],
				["ItemCorrugatedLg",1,3],
				["ItemCorrugated",2,9],
				["ItemMixOil",1,2],
				["MortarBucket",3,6],
				["PartPlankPack",10,12],
				["ItemLockbox",1,3],
				["3rnd_HE_Grenade_Shell",2,4],
				["EnergyPackLg",1,2],
				["30Rnd_65x39_caseless_green",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_556x45_Stanag",3,6],
				["30Rnd_45ACP_Mag_SMG_01",3,6],
				["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,8],
				["20Rnd_762x51_Mag",3,11],
				["200Rnd_65x39_cased_Box",3,6],
				["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,3],
				["HandGrenade",1,3],
				["EnergyPack",2,5],
				// Marksman Pack Ammo				
				["10Rnd_338_Mag",1,4],
				["10Rnd_338_Mag",1,4],				
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]					
			],			
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
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
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH","5Rnd_127x108_Mag"],
				["m107Tan_EPOCH","5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH","200Rnd_556x45_M249"],
				["m249Tan_EPOCH","200Rnd_556x45_M249"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"]		
			],
			[//Magazines
				["CinderBlocks",2,6],
				["jerrycan_epoch",1,3],
				["lighter_epoch",1,1],
				["CircuitParts",2,3],
				["WoodLog_EPOCH",10,20],
				["ItemCorrugatedLg",0,4],
				["ItemCorrugated",3,6],
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
				["20Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,6],
				// Marksman Pack Ammo				
				["150Rnd_93x64_Mag",1,4],
				["10Rnd_338_Mag",1,4],
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],	
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_AMS_snd",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
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
				["SMG_02_F","30Rnd_9x21_Mag"],
				["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],
				["Hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["M14_EPOCH","20Rnd_762x51_Mag"],
				["M14Grn_EPOCH","20Rnd_762x51_Mag"],				
				["arifle_MXM_F","30Rnd_65x39_caseless_mag_Tracer"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],				
				["m107_EPOCH","5Rnd_127x108_Mag"],
				["m107Tan_EPOCH","5Rnd_127x108_Mag"],				
				["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_LRR_F","7Rnd_408_Mag"],
				["srifle_EBR_F","20Rnd_762x51_Mag"],
				["srifle_GM6_F","5Rnd_127x108_APDS_Mag"],
				["m249_EPOCH","200Rnd_556x45_M249"],
				["m249Tan_EPOCH","200Rnd_556x45_M249"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"],
				["Arifle_MX_SW_F","100Rnd_65x39_caseless_mag_Tracer"],
				["Arifle_MX_SW_Black_F","100Rnd_65x39_caseless_mag_Tracer"],
				["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],
				["MMG_01_hex_F","150Rnd_93x64_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],
				["srifle_DMR_06_camo_F","10Rnd_338_Mag"]
			],
			[//Magazines
				["CinderBlocks",2,7], ["jerrycan_epoch",1,3],["lighter_epoch",1,1],["CircuitParts",2,6],["WoodLog_EPOCH",10,20],["ItemCorrugatedLg",0,5],["ItemCorrugated",3,7],["ItemMixOil",1,2],
				["MortarBucket",2,5],["PartPlankPack",10,12],["ItemLockbox",1,2],["EnergyPackLg",0,1],
				
				["3rnd_HE_Grenade_Shell",1,5],["30Rnd_65x39_caseless_green",3,6],["30Rnd_556x45_Stanag",3,6],["30Rnd_556x45_Stanag",3,6],["30Rnd_45ACP_Mag_SMG_01",3,6],["20Rnd_556x45_UW_mag",3,6],
				["10Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,10],["10Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,10],["200Rnd_65x39_cased_Box",3,6],["100Rnd_65x39_caseless_mag_Tracer",3,6],
				["3rnd_HE_Grenade_Shell",1,2],["HandGrenade",1,3],["EnergyPack",2,5],["20Rnd_762x51_Mag",3,6],["20Rnd_762x51_Mag",3,6],
				// Marksman Pack Ammo				
				["150Rnd_93x64_Mag",1,4],
				["10Rnd_338_Mag",1,4],
				["10Rnd_127x54_Mag" ,1,4],
				["10Rnd_127x54_Mag",1,4],
				["10Rnd_93x64_DMR_05_Mag" ,1,4]				
			],		
			[  // Optics
				["optic_SOS",1,2],["optic_LRPS",1,2],["optic_DMS",1,2],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Holosight",1,3],["acc_flashlight",1,3],["acc_pointer_IR",1,3],
				["optic_Arco",1,3],["optic_Hamr",1,3],["optic_Aco",1,3],["optic_ACO_grn",1,3],["optic_Aco_smg",1,3],["optic_ACO_grn_smg",1,3],
				["optic_Holosight",1,3],["optic_Holosight_smg",1,3],["optic_SOS",1,3],["optic_MRCO",1,3],["optic_DMS",1,3],["optic_Yorris",1,3],
				["optic_MRD",1,3],["optic_LRPS",1,3],["optic_NVS",1,3],["optic_Nightstalker",1,2],
				["optic_tws",1,3],["optic_tws_mg",1,3],["muzzle_snds_H",1,3],["muzzle_snds_L",1,3],["muzzle_snds_M",1,3],["muzzle_snds_B",1,3],["muzzle_snds_H_MG",1,3],["muzzle_snds_acp",1,3],
				["optic_AMS_khk",1,3],["optic_KHS_blk",1,3],["optic_KHS_hex",1,3],["optic_KHS_old",1,3],["optic_KHS_tan",1,3]
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


	// Time the marker remains after completing the mission in seconds - experimental not yet implemented
	blck_MarkerPeristTime = 300;  // experimental	
	blck_crateTypes = ["Box_NATO_Wps_F"];  // for future use
	
	diag_log "[blckeagls] Configurations Loaded";

	true;