// Adapted from the Random Loot Crates pbo by Darth_Rogue & Chisel (tdwhite)  
// Modified by Ghostrider-DBD- with thanks to cyncrwler for initial testing and feedback

//*****************************LOOT LISTS************************
/*
	Loot types:
	0 = randomly selected loadout from the list below
	1 = building materials, sledges, hatchets and chainsaws.
	2 = weapons, mines, NVG, range finder, radios
	3 = misc loot, multiguns, other utility items.
	4 = weapons, vests, backpacks and headgear.
*/
diag_log "Loading Static Loot Container Spawning System for Epoch";

_lootBoxes = [];

_worldName = toLower format ["%1", worldName];

/// Adjust Configurations Here
//  Please see the example below for ideas about how to use this function
switch (_worldName) do {
	case "altis":{
		diag_log "Altis-specific settings loaded using crates as of 5-10-15";
			_lootBoxes = [
				// Dump
				[ 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[5791,20314.5,0],0,false, true], // crate position 1, loadout (0-4), false=random placement near position, true = show smoke at position
					[[5902.33,20272.7,0],0,false, true],
					[[5955.21,20136.2,0],0,false, true],
					[[5908.32,20088.3,0],0,false, true],
					[[55843.54,20171.6,0],0,false, true],
					[[5775.42,20163.3,0],0,false, true],
					[[5979.18,20206.5,0],0,false, true],
					[[5943.89,20076.7,0],0,false, true]
					]
				],
				// Beach #1
				[ 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[22769.8,7051.28,0],0,false, false], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[22934.3,6990.53,0],0,false, false],
					[[22831.7,7003.24,0],0,false, false],
					[[22666.6,7009.22,0],0,false, false],
					[[22634.6,6985.3,0],0,false, false],
					[[22583.4,6935.63,0],0,false, false],
					[[22651.1,7060.75,0],0,false, false]
					]
				]				
			
			];
	}; 

	case "bornholm":{
		// Setup for Bornholm AI controlled sector		
		_lootBoxes = [  // format as [_position, _lootType (range 1-4), use random spawn location (true/false)] or [_position, 0] for randomly selected loot.
			
				[4,
				// Stronghold 1
					[
					[[16776.3,2841.59,0.115455],2,false, false],
					[[16885.1,2763.64,0.0635304],4,false, false],
					[[16953.7,2588.12,0.0866053],2,false, false],
					[[17028.5,2645.56,0.0632489],4,false, false],		
					[[16818.7,2627.68,0.0635295],2,false, false],
					[[16828.1,2794.94,0.086482],4,false, false],
					[[16776.8,2842.19,0.115454],2,false, false]					
					]
				],
				[4,
				// Stronghold 2
					[
					[[4342.52,19974.5,1.5059],2,false, false],
					[[4364.01,19957.2,1.7643],4,false, false],
					[[4337.55,19886.1,0.923979],2,false, false],
					[[4317.76,19915.3,0.336912],4,false, false],
					[[4261.73,19957,0.0783005],2,false, false],				
					[[4280.66,19961.2,0.180275],4,false, false],
					[[4318.1,19916.5,0.514435],2,false, false]					
					]
				],			
			
				[4,// ** Note that there is no comma after the last entry.
				// Darth's Object 99 blah blah
					[
						
					[[7231.91,11975.8,0.836342],2,false, false],
					[[7266.08,11981.6,1.0471],4,false, false],
					[[7337.64,12011.6,12.7679],2,false, false],
					[[7264.35,12020.1,0.661186],4,false, false],
					[[7204.27,12058.5,0.632904],2,false, false],
					[[7265.46,12128.6,0.00143433],4,false, false],
					[[7250.85,12142.9,3.16084],2,false, false],
					[[7215.93,12121.1,0.224915],4,false, false],
					[[7207.59,12159.8,0.73732],2,false, false],
					[[7184.07,12231.1,8.72117],4,false, false],
					[[7172.28,12021.2,0.664284],2,false, false],
					[[7147.93,12056.5,0.848099],4,false, false],					
					[[7137.67,12110.8,4.0068],2,false, false],	
					[[7166,12138,3.86438],4,false, false],	
					[[7130.52,12207.9,0.56971],4,false, false]	
					]
				]	
			
		]; 
	};
	case "tanoa": {
		_lootBoxes = 
		[  // format as [_position, _lootType (range 1-4), use random spawn location (true/false)] or [_position, 0] for randomly selected loot.
			[0,
				[[0,0,0],0,false,false]
			]
		]
	};

	default {
		_lootBoxes = 
		[
			[0,
				[[0,0,0],0,false,false]
			]
		]	
	};
};
// END of configurations

diag_log format["[crateLoot.sqf] --- >>> worldname is %1",_worldName]; 

// Edit these to your liking
//Uniforms
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_uniforms = ["U_O_CombatUniform_ocamo", "U_O_GhillieSuit", "U_O_PilotCoveralls", "U_O_Wetsuit", "U_OG_Guerilla1_1", "U_OG_Guerilla2_1", "U_OG_Guerilla2_3", "U_OG_Guerilla3_1", "U_OG_Guerilla3_2", "U_OG_leader", "U_C_Poloshirt_stripped", "U_C_Poloshirt_blue",
				"U_C_Poloshirt_burgundy", "U_C_Poloshirt_tricolour", "U_C_Poloshirt_salmon", "U_C_Poloshirt_redwhite", "U_C_Poor_1", "U_C_WorkerCoveralls", "U_C_Journalist", "U_C_Scientist", "U_OrestesBody", "U_Wetsuit_uniform", "U_Wetsuit_White", "U_Wetsuit_Blue", 
				"U_Wetsuit_Purp", "U_Wetsuit_Camo", "U_CamoRed_uniform", "U_CamoBrn_uniform", "U_CamoBlue_uniform", "U_Camo_uniform", "U_ghillie1_uniform", "U_ghillie2_uniform", "U_ghillie3_uniform","U_B_FullGhillie_ard","U_I_FullGhillie_ard","U_O_FullGhillie_ard",
				"Full Ghillie Suit Semi-Arid:","U_B_FullGhillie_sard","U_O_FullGhillie_sard","U_I_FullGhillie_sard","Full Ghillie Suit Lush","U_B_FullGhillie_lsh","U_O_FullGhillie_lsh","U_I_FullGhillie_lsh"];

//Weapons
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

_loot_pistols = [["hgun_ACPC2_F","9Rnd_45ACP_Mag"],["hgun_Rook40_F","16Rnd_9x21_Mag"],["hgun_P07_F","16Rnd_9x21_Mag"],["hgun_Pistol_heavy_01_F","11Rnd_45ACP_Mag"],["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"],["ruger_pistol_epoch","10rnd_22X44_magazine"],["1911_pistol_epoch","9Rnd_45ACP_Mag"]];
_loot_rifles = 	[["arifle_Katiba_F","30Rnd_65x39_caseless_green"],["arifle_Katiba_C_F","30Rnd_65x39_caseless_green"],["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],["arifle_MXC_F","30Rnd_65x39_caseless_mag"],["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],["arifle_MXM_F","30Rnd_65x39_caseless_mag"],["arifle_SDAR_F","20Rnd_556x45_UW_mag"],[ "arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red"],["arifle_TRG20_F","30Rnd_556x45_Stanag_Tracer_Red"],
				["arifle_TRG21_GL_F","30Rnd_556x45_Stanag_Tracer_Red"],["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Green"],["arifle_Mk20C_F","30Rnd_556x45_Stanag_Tracer_Green"],["arifle_Mk20_GL_F","30Rnd_556x45_Stanag_Tracer_Green"],["arifle_Mk20_plain_F","30Rnd_556x45_Stanag_Tracer_Yellow"],
				["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag_Tracer_Yellow"],["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag_Tracer_Yellow"],["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green"],["SMG_02_F","30Rnd_9x21_Mag"],["hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],["arifle_MX_GL_Black_F","30Rnd_65x39_caseless_mag_Tracer"],["arifle_MX_Black_F","30Rnd_65x39_caseless_mag"],["arifle_MXC_Black_F","30Rnd_65x39_caseless_mag"],["Rollins_F","5Rnd_rollins_mag"],
				["AKM_EPOCH","30Rnd_762x39_Mag"],["m4a3_EPOCH","30Rnd_556x45_Stanag"],["m16_EPOCH","30Rnd_556x45_Stanag"],["m16Red_EPOCH","30Rnd_556x45_Stanag"]];
_loot_snipers = [["srifle_EBR_F","20Rnd_762x51_Mag"],["srifle_GM6_F","5Rnd_127x108_Mag"],["srifle_LRR_F","7Rnd_408_Mag"],["srifle_DMR_01_F","10Rnd_762x51_Mag"],["M14_EPOCH","20Rnd_762x51_Mag"],["M14Grn_EPOCH","20Rnd_762x51_Mag"],["m107_EPOCH","5Rnd_127x108_Mag"],
				["m107Tan_EPOCH","5Rnd_127x108_Mag"],["SR25_EPOCH","20Rnd_762x51_Mag"],["srifle_DMR_02_camo_F","10Rnd_338_Mag"],["srifle_DMR_02_F","10Rnd_338_Mag"],["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],["srifle_DMR_03_F","10Rnd_338_Mag"],["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],["srifle_DMR_05_hex_F","10Rnd_338_Mag"],["srifle_DMR_05_tan_F","10Rnd_338_Mag"],["srifle_DMR_06_camo_F","10Rnd_338_Mag"],["srifle_DMR_04_F","10Rnd_127x54_Mag"],["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]];
_loot_LMG = 	[["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],["MMG_01_hex_F","150Rnd_93x64_Mag"],["MMG_01_tan_F","150Rnd_93x64_Mag"],["MMG_02_black_F","150Rnd_93x64_Mag"],["MMG_02_camo_F","150Rnd_93x64_Mag"],["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["m249_EPOCH","200Rnd_556x45_M249"],["m249Tan_EPOCH","200Rnd_556x45_M249"],["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"]];

//Silencers
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_silencers = ["muzzle_sr25S_epoch","muzzle_snds_H","muzzle_snds_M","muzzle_snds_L","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_acp","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_338_black","muzzle_snds_338_greenmuzzle_snds_338_sand"];

//Optics
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_optics = ["optic_NVS","optic_tws","optic_tws_mg","optic_SOS","optic_LRPS","optic_DMS","optic_Arco","optic_Hamr","Elcan_epoch","Elcan_reflex_epoch","optic_MRCO","optic_Holosight","optic_Holosight_smg","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Yorris","optic_MRD","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan"];

//Backpacks
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_backpacks = ["B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Parachute", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr", "smallbackpack_red_epoch", "smallbackpack_green_epoch", "smallbackpack_teal_epoch", "smallbackpack_pink_epoch"];

//Vests
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_vests = ["V_1_EPOCH", "V_2_EPOCH", "V_3_EPOCH", "V_4_EPOCH", "V_5_EPOCH", "V_6_EPOCH", "V_7_EPOCH", "V_8_EPOCH", "V_9_EPOCH", "V_10_EPOCH", "V_11_EPOCH", "V_12_EPOCH", "V_13_EPOCH", "V_14_EPOCH", "V_15_EPOCH", "V_16_EPOCH", "V_17_EPOCH", "V_18_EPOCH", "V_19_EPOCH", "V_20_EPOCH", "V_21_EPOCH", "V_22_EPOCH", "V_23_EPOCH", "V_24_EPOCH", "V_25_EPOCH", "V_26_EPOCH", "V_27_EPOCH", "V_28_EPOCH", "V_29_EPOCH", "V_30_EPOCH", "V_31_EPOCH", "V_32_EPOCH", "V_33_EPOCH", "V_34_EPOCH", "V_35_EPOCH", "V_36_EPOCH", "V_37_EPOCH", "V_38_EPOCH", "V_39_EPOCH", "V_40_EPOCH","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierIAGL_oli"];

//Head Gear
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_headgear = ["H_1_EPOCH","H_2_EPOCH","H_3_EPOCH","H_4_EPOCH","H_5_EPOCH","H_6_EPOCH","H_7_EPOCH","H_8_EPOCH","H_9_EPOCH","H_10_EPOCH","H_11_EPOCH","H_12_EPOCH","H_13_EPOCH","H_14_EPOCH","H_15_EPOCH","H_16_EPOCH","H_17_EPOCH","H_18_EPOCH","H_19_EPOCH","H_20_EPOCH","H_21_EPOCH","H_22_EPOCH","H_23_EPOCH","H_24_EPOCH","H_25_EPOCH","H_26_EPOCH","H_27_EPOCH","H_28_EPOCH","H_29_EPOCH","H_30_EPOCH","H_31_EPOCH","H_32_EPOCH","H_33_EPOCH","H_34_EPOCH","H_35_EPOCH","H_36_EPOCH","H_37_EPOCH","H_38_EPOCH","H_39_EPOCH","H_40_EPOCH","H_41_EPOCH","H_42_EPOCH","H_43_EPOCH","H_44_EPOCH","H_45_EPOCH","H_46_EPOCH","H_47_EPOCH","H_48_EPOCH","H_49_EPOCH","H_50_EPOCH","H_51_EPOCH","H_52_EPOCH","H_53_EPOCH","H_54_EPOCH","H_55_EPOCH","H_56_EPOCH","H_57_EPOCH","H_58_EPOCH","H_59_EPOCH","H_60_EPOCH","H_61_EPOCH","H_62_EPOCH","H_63_EPOCH","H_64_EPOCH","H_65_EPOCH","H_66_EPOCH","H_67_EPOCH","H_68_EPOCH","H_69_EPOCH","H_70_EPOCH","H_71_EPOCH","H_72_EPOCH","H_73_EPOCH","H_74_EPOCH","H_75_EPOCH","H_76_EPOCH","H_77_EPOCH","H_78_EPOCH","H_79_EPOCH","H_80_EPOCH","H_81_EPOCH","H_82_EPOCH","H_83_EPOCH","H_84_EPOCH","H_85_EPOCH","H_86_EPOCH","H_87_EPOCH","H_88_EPOCH","H_89_EPOCH","H_90_EPOCH","H_91_EPOCH","H_92_EPOCH","H_93_EPOCH","H_94_EPOCH","H_95_EPOCH","H_96_EPOCH","H_97_EPOCH","H_98_EPOCH","H_99_EPOCH","H_100_EPOCH","H_101_EPOCH","H_102_EPOCH","H_103_EPOCH","H_104_EPOCH"];

//Food
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_food = ["FoodSnooter","FoodWalkNSons","FoodBioMeat","ItemSodaOrangeSherbet","ItemSodaPurple","ItemSodaMocha","ItemSodaBurst","ItemSodaRbull","honey_epoch","emptyjar_epoch","sardines_epoch","meatballs_epoch","scam_epoch","sweetcorn_epoch","WhiskeyNoodle","ItemCoolerE","ItemTrout","ItemSeaBass","ItemTuna"];

//Misc
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_Misc = ["PaintCanClear","PaintCanBlk","PaintCanBlu","PaintCanBrn","PaintCanGrn","PaintCanOra","PaintCanPur","PaintCanRed","PaintCanTeal","PaintCanYel","ItemDocument","ItemMixOil","emptyjar_epoch","FoodBioMeat","ItemSodaOrangeSherbet","ItemSodaPurple","ItemSodaMocha","ItemSodaBurst","ItemSodaRbull","sardines_epoch","meatballs_epoch","scam_epoch","sweetcorn_epoch","Towelette","HeatPack","ColdPack","VehicleRepair","VehicleRepairLg","CircuitParts","ItemCoolerE","ItemScraps","ItemScraps","lighter_epoch","EnergyPack","EnergyPackLg"];

//Construction
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_build = ["MortarBucket","MortarBucket","ItemCorrugated","ItemCorrugatedLg","CinderBlocks","VehicleRepairLg","VehicleRepair","CircuitParts","ItemScraps","KitShelf","KitWoodFloor","KitWoodStairs"];

// Define functions
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// allows a visible cue to be spawned near the crate
_fn_smokeAtCrate = { // adapted from Ritchies heli crash addon
	private ["_pos","_smokeSource","_smokeTrail","_fire","_posFire","_smoke","_randomLocation","_px","_py"];

	// Use the Land_Fire_burning item if you want a bright visual cue at night but be forewarned that the flames are blinding with NVG at close range
	// http://www.antihelios.de/EK/Arma/index.htm
	_wrecks = ["Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Tyres_F","Land_Pallets_F","Land_MetalBarrel_F"];
	_smokeSource = _wrecks call BIS_fnc_selectRandom;  //other choices might be "Land_CanisterPlastic_F","Land_MetalBarrel_F", "Land_Pallets_F", "Land_Tyres_F", "Land_Wreck_Car2_F", "Land_HumanSkeleton_F", "Land_Wreck_Car2_F";
	_smokeTrail = "test_EmptyObjectForFireBig"; // "optiosn are "test_EmptyObjectForFireBig", "test_EmptyObjectForSmoke"
	_pos = _this select 0;
	_px = _pos select 0;
	_py = _pos select 1;
	_pos = [_px, _py, 0];
	
	_dis = 0;

	// _minDis and _maxDis determine the spacing between the smoking item and the loot crate.
	_minDis = 10;  // have to remember that some of the objects like the truck wrecks are large
	_maxDis = 15;
	_closest = 10;
	// find a random location and run a check to be sure the spacing is OK
	while {_dis < _minDis} do
	{
		_posFire = [_pos, _minDis, _maxDis, _closest, 0, 20, 0] call BIS_fnc_findSafePos;  // find a safe spot near the location passed in the call
		_dis = _posFire distance _pos;
	};
	
	_posFire = [_pos, 5, 15, 10, 0, 20, 0] call BIS_fnc_findSafePos;  // find a safe spot near the location passed in the call
	_fire = createVehicle [_smokeSource, _posFire, [], 0, "can_collide"];
	
	_fire setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
	_fire setPos _pos;
	_fire setDir floor(random(360));
	_smoke = createVehicle [_smokeTrail, _posFire, [], 0, "can_collide"];  // "test_EmptyObjectForSmoke" createVehicle _posFire;  
	_smoke setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
	_smoke attachto [_fire, [0,0,-1]]; 
};
  
// fill the crate with something
_fn_spawnCrate = {

	private["_crate1","_lootType","_cratePos","_minDistfromCenter","_maxDistfromCenter","_clossestObj","_spawnOnWater","_spawnAtShore","_pos","_noItemTypes","_partToAdd","_randomLocation","_useSmoke",
	"_px","_py","_pz"];
	//diag_log format["_fn_spawnCrate _this = %1",_this];
	
	_cratePos = _this select 0;		
	_lootType = [_this, 1, 0] call BIS_fnc_param; // if a loot type is passed us this otherwise use a randomly selected loot type.
	_randomLocation = [_this, 2, true] call BIS_fnc_param;
	_useSmoke = [_this, 3, false] call BIS_fnc_param;
	
	//diag_log format["_fn_spawnCrate %1, %2, %3, %4",_cratePos,_lootType,_randomLocation,_useSmoke];
	
	// Spawn an Empty a Crate
	// find a safe location for the crate
	_minDistfromCenter = 0;
	_maxDistfromCenter = 25;
	_clossestObj = 10;
	_spawnOnWater = 0; // water mode 0: cannot be in water , 1: can either be in water or not , 2: must be in water
	_spawnAtShore = 0; // 0: does not have to be at a shore , 1: must be at a shore
	
	if (_randomLocation) then{
		_pos = [_cratePos,_minDistfromCenter,_maxDistfromCenter,_clossestObj,_spawnOnWater,20,_spawnAtShore] call BIS_fnc_findSafePos; // find a random loc 
	}
	else
	{
		_pos = _cratePos;
		//diag_log format["crate spawner using exact position %1",_pos];
	};

	private["_crateTypes","_selectedCrateType"];
	_crateTypes = ["I_CargoNet_01_ammo_F","O_CargoNet_01_ammo_F","B_CargoNet_01_ammo_F","I_supplyCrate_F","Box_East_AmmoVeh_F","Box_NATO_AmmoVeh_F"];
	_selectedCrateType = _crateTypes call BIS_fnc_selectRandom;	
	// create a crate
	_crate_1 = objNull;
	_crate_1 = createVehicle [_selectedCrateType, _pos, [], 0, "CAN_COLLIDE"];
	_crate_1 allowDamage false;
	_px = _pos select 0;
	_py = _pos select 1;
	_crate_1 setPosATL [_px,_py, 0.25];
	
	_crate_1 setDir round(random(36));
	//_crate_1 setVariable ["LAST_CHECK", (diag_tickTime + 14400)];  // prevent the crate from being cleaned up

	//Remove whatever the crate spawned with.
	clearWeaponCargoGlobal _crate_1;
	clearMagazineCargoGlobal _crate_1;
	clearBackpackCargoGlobal _crate_1;
	clearItemCargoGlobal _crate_1;	

	// a _lootType == 0 means randomly select a crate loadout so lets pick a random number
	if (_lootType == 0) then
	{
		_lootType = floor(random(4)) + 1;
	};
	
	if (_lootType == 1) then
	{
		_noItemTypes = 7;
		for "_i" from 1 to _noItemTypes do
		{
			_items = round((_noItemTypes - _i)/2) + floor(random 1 + floor(_i/2));
			_crate_1 addMagazineCargoGlobal [_loot_build call BIS_fnc_selectRandom, _items];
		};
		//_crate_1 addWeaponCargoGlobal ["Hatchet",2];
		//_crate_1 addWeaponCargoGlobal ["MeleeSledge",2];
		//_crate_1 addWeaponCargoGlobal ["ChainSaw",1];
		//_crate_1 addItemCargoGlobal ["water_epoch",10];	
	};

	if (_lootType == 2) then
	{
		_noRifles = 9;
		for "_i" from 1 to _noRifles do
		{
			//diag_log format[" ---- <<<< _loot_rifles is %1",_loot_rifles];
			_rifle = _loot_rifles call BIS_fnc_selectRandom;
			//diag_log format["--->>> parameter _rifle is %1",_rifle];
			_crate_1 addWeaponCargoGlobal [_rifle select 0, 1];
			_crate_1 addMagazineCargoGlobal [_rifle select 1, (3 + floor(random 3))];
		};
		_noPistols = 3;
		for "_i" from 1 to _noPistols do
		{
			_pistol = _loot_pistols call BIS_fnc_selectRandom;
			_crate_1 addWeaponCargoGlobal [_pistol select 0,1];
			_crate_1 addMagazineCargoGlobal [_pistol select 1, (3 + floor(random 3))];
		};
		_noLMG = 5;
		for "_i" from 1 to _noLMG do
		{
			_LMG = selectRandom _loot_LMG;  // call BIS_fnc_selectRandom;
			_crate_1 addWeaponCargoGlobal [_LMG select 0,1];
			_crate_1 addMagazineCargoGlobal [_LMG select 1, (1 + floor(random 3))];
		};
		_noSniper = 4;
		for "_i" from 1 to _noSniper do
		{
			_sniper = selectRandom _loot_snipers; // call BIS_fnc_selectRandom;
			_crate_1 addWeaponCargoGlobal [_sniper select 0,1];
			_crate_1 addMagazineCargoGlobal [_sniper select 1, (3 + floor(random 3))];
		};
		_noSilencers = 8;
		for "_i" from 1 to _noSilencers do
		{
			_crate_1 addItemCargoGlobal [(selectRandom _loot_silencers),(1 + floor(random 1))];
		};
		_noOptics = 6;
		for "_i" from 1 to _noOptics do
		{
			_crate_1 additemCargoGlobal [(selectRandom _loot_optics), (2 + floor(random 1))];
		};
		_noVests = 5;
		for "_i" from 1 to _noVests do
		{		
			_crate_1 addItemCargoGlobal [(selectRandom _loot_vests),(1 + floor(random 1))];
		};
		_noBackpacks = 3;
		for "_i" from 1 to _noBackpacks do
		{
			_crate_1 addBackpackCargoGlobal [(selectRandom _loot_backpacks),(1 + floor(random 1))];
		};
		//_crate_1 addItemCargoGlobal ["EpochRadio0",2];
		//_crate_1 additemCargoGlobal ["NVG_EPOCH",2];
		_crate_1 additemCargoGlobal ["ItemGPS",1];
		_crate_1 addWeaponCargoGlobal ["Rangefinder",1];
		_crate_1 addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",3];
		_crate_1 addMagazineCargoGlobal ["DemoCharge_Remote_Mag",3];
		_crate_1 addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",3];
		_noItemTypes = 5;
		for "_i" from 1 to _noItemTypes do
		{
			_items = round((_noItemTypes - _i)/2) + floor(random 1 + floor(_i/2));
			_crate_1 addMagazineCargoGlobal [selectRandom _loot_build, _items];
		};		
	};

	if (_lootType == 3) then
	{
		_noMiscTypes = 10;
		_maxNoEachItem = 10;
		for "_i" from 1 to _noMiscTypes do
		{
			_items = (round(random(_maxNoEachItem)));
			_partToAdd = selectRandom _loot_misc; // call BIS_fnc_selectRandom;
			//diag_log format["<<<<--- for loot type 3 number of parts is %1 and part is %2",_items,_partToAdd];
			_crate_1 addMagazineCargoGlobal [_partToAdd,_items];
		};
		_crate_1 addWeaponCargoGlobal ["MultiGun",3];
		_crate_1 addMagazineCargoGlobal ["EnergyPack",5];
		_crate_1 addMagazineCargoGlobal ["EnergyPackLg",3];
		_crate_1 addMagazineCargoGlobal ["ItemLockBox",2];
		_crate_1 addMagazineCargoGlobal ["jerrycan_epoch",2];
		_crate_1 addMagazineCargoGlobal ["ItemGoldBar10oz",2];
		_crate_1 addMagazineCargoGlobal ["ItemSilverBar",4];
		_crate_1 addMagazineCargoGlobal ["ItemKiloHemp",4];
 
	};

	if (_lootType == 4) then
	{
 
		_noRifles = 8;
		for "_i" from 1 to _noRifles do
		{
			_rifle = selectRandom _loot_rifles;  // call BIS_fnc_selectRandom;
			//diag_log format["[random_crateLoot] -- >> _rifle contains  %1",_rifle];
			_weap = _rifle select 0;
			_ammo = _rifle select 1;
			_crate_1 addWeaponCargoGlobal [_weap, 1];
			_crate_1 addMagazineCargoGlobal [_ammo, (3 + floor(random 3))];
		};
		_noPistols = 3;
		for "_i" from 1 to _noPistols do
		{
			_pistol = selectRandom _loot_pistols; // call BIS_fnc_selectRandom;
			_crate_1 addWeaponCargoGlobal [_pistol select 0,1];
			_crate_1 addMagazineCargoGlobal [_pistol select 1, (3 + floor(random 3))];
		};
		_noLMG = 6;
		for "_i" from 1 to _noLMG do
		{
			_LMG = selectRandom _loot_LMG;  // call BIS_fnc_selectRandom;
			_crate_1 addWeaponCargoGlobal [_LMG select 0,1];
			_crate_1 addMagazineCargoGlobal [_LMG select 1, (1 + floor(random 3))];
		};
		_noSniper = 4;
		for "_i" from 1 to _noSniper do
		{
			_sniper = _loot_snipers call BIS_fnc_selectRandom;
			_crate_1 addWeaponCargoGlobal [_sniper select 0,1];
			_crate_1 addMagazineCargoGlobal [_sniper select 1, (3 + floor(random 3))];
		};
		_noUniforms = 6;
		for "_i" from 1 to _noUniforms do
		{
			_crate_1 addItemCargoGlobal [(selectRandom _loot_uniforms),1];
		};
		_noVests = 4;
		for "_i" from 1 to _noVests do
		{
			_crate_1 addItemCargoGlobal [(selectRandom  _loot_vests),(1 + floor(random 1))];
		};
		_noHeadgear = 4;
		for "_i" from 1 to _noHeadgear do
		{
			_crate_1 addItemCargoGlobal [(selectRandom  _loot_headgear),1];
		};
		_noBackpacks = 3;
		for "_i" from 1 to _noBackpacks do
		{
			_crate_1 addBackpackCargoGlobal [(selectRandom  _loot_backpacks),(1 + floor(random 1))];
		};
		_noItemTypes = 6;
		for "_i" from 1 to _noItemTypes do
		{
			_items = round((_noItemTypes - _i)/2) + floor(random 1 + floor(_i/2));
			_crate_1 addMagazineCargoGlobal [selectRandom  _loot_build, _items];
		};		
	};
	if (_useSmoke) then
	{
		[_cratePos] call _fn_smokeAtCrate;
	};
};
// run the above scripts
_fn_selectRandomItemsFromArray = {
	private["_array","_no_toSelect","_counter","_selected","_item"];
	_array = _this select 0;
	_no_toSelect = _this select 1;
	_counter = 0;
	_selected = [];
	_item = [];
	//diag_log format["--->>> _no_toSelect = %1", _no_toSelect];
	//diag_log format["--->>>_array = %1",_array];
	while {_counter < _no_toSelect} do {
		_item = selectRandom _array; // call BIS_fnc_selectRandom;
		if (!(_item in _selected)) then {
			//diag_log format["--->>> _item = %1",_item];
			_selected = _selected + [_item];
			_counter = _counter + 1;
		};
	};
	//diag_log format["--->>> Crate Spawner:: random items in selected = %1",_selected];
	_selected
};
_fn_Run = {
	private["_cratePosnList","_no","_ar","_x","_cratePos","_lootType","_randomPos","_useSmoke"];
	{
		_no = _x select 0;
		_ar = _x select 1;
		_cratePosnList = [_ar, _no] call _fn_selectRandomItemsFromArray;
		//diag_log format["--->>> Crate Spawner:: _cratePosnList = %1",_cratePosnList];
		{
			diag_log format["[blckeagls] SLS:: spawning crate spawning crate --->>> %1",_x];
			_cratePos = _x select 0;  // get crate position
			_lootType= _x select 1;
			_randomPos = _x select 2;
			_useSmoke = _x select 3;
			[_cratePos,_lootType,_randomPos,_useSmoke] call _fn_SpawnCrate;
		} forEach _cratePosnList;
		
	} forEach _lootBoxes;
};

// Start everything up.
[] call _fn_Run;
blck_SLSComplete = true;
diag_log "[blckeagls] SLS System: Static crates loaded successfully for Epoch!";