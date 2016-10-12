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
diag_log "[blckeagls]  Loading Static Loot Container Spawning System for ExileMod for Arma3";
private["_startTime"];
_startTime = diag_tickTime;
_lootBoxes = [];
_add_launchers = false;
_worldName = toLower format ["%1", worldName];

/// Adjust Configurations Here
switch (_worldName) do {
	case "altis":{
		diag_log "Altis-specific settings loaded using crates as of 5-10-15";
			_lootBoxes = [
				// Ferres
				
				[ 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[21693.887,7731.0264,13.955027],0,true, true], // crate position 1, loadout (0-4), true=random placement near position, true = show smoke at position
					[[21850.063,7504.3203,14.677059],0,true, true],
					[[21693.674,7431.4141,15.578629],0,true, true],
					[[21631.227,7773.9927,14.149431],0,true, true],
					[[21572.559,7462.2661,17.827536],0,true, true],
					[[21801.348,7631.4448,13.80711],0,true, true],
					[[21508.932,7585.6309,15.844649],0,true, true],
					[[21547.027,7695.6738,15.754698],0,true, true]
					]
				],
				// Dump
				[ 4,							// Number of crates to select from the array of possible possitions below. Note that there can be multiple arrays of this type.
					[
					[[5791,20314.5,0],0,false, true,true], // crate position 1, loadout (0-4), false=random placement near position, true = show smoke at position
					[[5902.33,20272.7,0],0,false, true,true],
					[[5955.21,20136.2,0],0,false, true,true],
					[[5908.32,20088.3,0],0,false, true,true],
					[[55843.54,20171.6,0],0,false, true,true],
					[[5775.42,20163.3,0],0,false, true,true],
					[[5979.18,20206.5,0],0,false, true,true],
					[[5943.89,20076.7,0],0,false, false,true]
					]
				]				
			];		
	};


	default {
		_lootBoxes = [];
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
_loot_pistols = [["hgun_ACPC2_F","9Rnd_45ACP_Mag"],["hgun_Rook40_F","16Rnd_9x21_Mag"],["hgun_P07_F","16Rnd_9x21_Mag"],["hgun_Pistol_heavy_01_F","11Rnd_45ACP_Mag"],["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"]];
_loot_rifles = 	[["arifle_Katiba_F","30Rnd_65x39_caseless_green"],["arifle_Katiba_C_F","30Rnd_65x39_caseless_green"],["arifle_Katiba_GL_F","30Rnd_65x39_caseless_green"],["arifle_MXC_F","30Rnd_65x39_caseless_mag"],["arifle_MX_F","30Rnd_65x39_caseless_mag"],
				["arifle_MX_GL_F","30Rnd_65x39_caseless_mag"],["arifle_MXM_F","30Rnd_65x39_caseless_mag"],["arifle_SDAR_F","20Rnd_556x45_UW_mag"],[ "arifle_TRG21_F","30Rnd_556x45_Stanag_Tracer_Red"],["arifle_TRG20_F","30Rnd_556x45_Stanag_Tracer_Red"],
				["arifle_TRG21_GL_F","30Rnd_556x45_Stanag_Tracer_Red"],["arifle_Mk20_F","30Rnd_556x45_Stanag_Tracer_Green"],["arifle_Mk20C_F","30Rnd_556x45_Stanag_Tracer_Green"],["arifle_Mk20_GL_F","30Rnd_556x45_Stanag_Tracer_Green"],["arifle_Mk20_plain_F","30Rnd_556x45_Stanag_Tracer_Yellow"],
				["arifle_Mk20C_plain_F","30Rnd_556x45_Stanag_Tracer_Yellow"],["arifle_Mk20_GL_plain_F","30Rnd_556x45_Stanag_Tracer_Yellow"],["SMG_01_F","30Rnd_45ACP_Mag_SMG_01_tracer_green"],["SMG_02_F","30Rnd_9x21_Mag"],["hgun_PDW2000_F","30Rnd_9x21_Mag"],
				["arifle_MXM_Black_F","30Rnd_65x39_caseless_mag_Tracer"],["arifle_MX_GL_Black_F","30Rnd_65x39_caseless_mag_Tracer"],["arifle_MX_Black_F","30Rnd_65x39_caseless_mag"],["arifle_MXC_Black_F","30Rnd_65x39_caseless_mag"]];
_loot_snipers = [["srifle_EBR_F","20Rnd_762x51_Mag"],["srifle_GM6_F","5Rnd_127x108_Mag"],["srifle_LRR_F","7Rnd_408_Mag"],["srifle_DMR_01_F","10Rnd_762x51_Mag"],
				["srifle_DMR_02_camo_F","10Rnd_338_Mag"],["srifle_DMR_02_F","10Rnd_338_Mag"],["srifle_DMR_02_sniper_F","10Rnd_338_Mag"],["srifle_DMR_03_F","10Rnd_338_Mag"],["srifle_DMR_03_tan_F","10Rnd_338_Mag"],
				["srifle_DMR_04_Tan_F","10Rnd_338_Mag"],["srifle_DMR_05_hex_F","10Rnd_338_Mag"],["srifle_DMR_05_tan_F","10Rnd_338_Mag"],["srifle_DMR_06_camo_F","10Rnd_338_Mag"],["srifle_DMR_04_F","10Rnd_127x54_Mag"],["srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag"],
				["srifle_DMR_06_olive_F","20Rnd_762x51_Mag"]];
_loot_LMG = 	[["LMG_Zafir_F","150Rnd_762x51_Box_Tracer"],["MMG_01_hex_F","150Rnd_93x64_Mag"],["MMG_01_tan_F","150Rnd_93x64_Mag"],["MMG_02_black_F","150Rnd_93x64_Mag"],["MMG_02_camo_F","150Rnd_93x64_Mag"],["MMG_02_sand_F","150Rnd_93x64_Mag"],
				["LMG_Mk200_F","200Rnd_65x39_cased_Box_Tracer"]];

//Silencers
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_silencers = ["muzzle_snds_H","muzzle_snds_M","muzzle_snds_L","muzzle_snds_B","muzzle_snds_H_MG","muzzle_snds_acp","muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_338_black","muzzle_snds_338_greenmuzzle_snds_338_sand"];

//Optics
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_optics = ["optic_NVS","optic_tws","optic_tws_mg","optic_SOS","optic_LRPS","optic_DMS","optic_Arco","optic_Hamr","optic_MRCO","optic_Holosight","optic_Holosight_smg","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Yorris","optic_MRD","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan"];

//Backpacks
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_backpacks = ["B_AssaultPack_cbr", "B_AssaultPack_dgtl", "B_AssaultPack_khk", "B_AssaultPack_mcamo", "B_AssaultPack_ocamo", "B_AssaultPack_rgr", "B_AssaultPack_sgg", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_ocamo", "B_Carryall_oli", "B_Carryall_oucamo", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_ocamo", "B_FieldPack_oli", "B_FieldPack_oucamo", "B_Kitbag_cbr", "B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_sgg", "B_Parachute", "B_TacticalPack_blk", "B_TacticalPack_mcamo", "B_TacticalPack_ocamo", "B_TacticalPack_oli", "B_TacticalPack_rgr"];

//Vests
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_vests = [			"V_Press_F",
			"V_Rangemaster_belt",
			"V_TacVest_blk",
			"V_TacVest_blk_POLICE",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
			"V_Chestrig_blk",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry",
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_rgr",
			"V_PlateCarrier3_rgr",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl",
			"V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr"];

//Head Gear
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_headgear = [	"H_Cap_blk",
			"H_Cap_blk_Raven",
			"H_Cap_blu",
			"H_Cap_brn_SPECOPS",
			"H_Cap_grn",
			"H_Cap_headphones",
			"H_Cap_khaki_specops_UK",
			"H_Cap_oli",
			"H_Cap_press",
			"H_Cap_red",
			"H_Cap_tan",
			"H_Cap_tan_specops_US",
			"H_Watchcap_blk",
			"H_Watchcap_camo",
			"H_Watchcap_khk",
			"H_Watchcap_sgg",
			"H_MilCap_blue",
			"H_MilCap_dgtl",
			"H_MilCap_mcamo",
			"H_MilCap_ocamo",
			"H_MilCap_oucamo",
			"H_MilCap_rucamo",
			"H_Bandanna_camo",
			"H_Bandanna_cbr",
			"H_Bandanna_gry",
			"H_Bandanna_khk",
			"H_Bandanna_khk_hs",
			"H_Bandanna_mcamo",
			"H_Bandanna_sgg",
			"H_Bandanna_surfer",
			"H_Booniehat_dgtl",
			"H_Booniehat_dirty",
			"H_Booniehat_grn",
			"H_Booniehat_indp",
			"H_Booniehat_khk",
			"H_Booniehat_khk_hs",
			"H_Booniehat_mcamo",
			"H_Booniehat_tan",
			"H_Hat_blue",
			"H_Hat_brown",
			"H_Hat_camo",
			"H_Hat_checker",
			"H_Hat_grey",
			"H_Hat_tan",
			"H_StrawHat",
			"H_StrawHat_dark",
			"H_Beret_02",
			"H_Beret_blk",
			"H_Beret_blk_POLICE",
			"H_Beret_brn_SF",
			"H_Beret_Colonel",
			"H_Beret_grn",
			"H_Beret_grn_SF",
			"H_Beret_ocamo",
			"H_Beret_red",
			"H_Shemag_khk",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_Shemag_tan",
			"H_ShemagOpen_khk",
			"H_ShemagOpen_tan",
			"H_TurbanO_blk",
			"H_HelmetB",
			"H_HelmetB_black",
			"H_HelmetB_camo",
			"H_HelmetB_desert",
			"H_HelmetB_grass",
			"H_HelmetB_light",
			"H_HelmetB_light_black",
			"H_HelmetB_light_desert",
			"H_HelmetB_light_grass",
			"H_HelmetB_light_sand",
			"H_HelmetB_light_snakeskin",
			"H_HelmetB_paint",
			"H_HelmetB_plain_blk",
			"H_HelmetB_sand",
			"H_HelmetB_snakeskin",
			"H_HelmetCrew_B",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetIA",
			"H_HelmetIA_camo",
			"H_HelmetIA_net",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetO_oucamo",
			"H_HelmetSpecB",
			"H_HelmetSpecB_blk",
			"H_HelmetSpecB_paint1",
			"H_HelmetSpecB_paint2",
			"H_HelmetSpecO_blk",
			"H_HelmetSpecO_ocamo",
			"H_CrewHelmetHeli_B",
			"H_CrewHelmetHeli_I",
			"H_CrewHelmetHeli_O",
			"H_HelmetCrew_I",
			"H_HelmetCrew_B",
			"H_HelmetCrew_O",
			"H_PilotHelmetHeli_B",
			"H_PilotHelmetHeli_I",
			"H_PilotHelmetHeli_O"
			];

//Food
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_food = ["Exile_Item_PlasticBottleFreshWater","Exile_Item_Beer","Exile_Item_Energydrink",
			"Exile_Item_GloriousKnakworst","Exile_Item_SausageGravy","Exile_Item_ChristmasTinner","Exile_Item_BBQSandwich","Exile_Item_Surstromming","Exile_Item_Catfood"
			];

//Misc
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_Misc = ["Exile_Item_InstaDoc","Exile_Item_Matches","Exile_Item_CookingPot"
				];

//Construction
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_loot_build = ["Exile_Item_Rope","Exile_Item_DuctTape","Exile_Item_ExtensionCord","Exile_Item_FuelCanisterEmpty",
				"Exile_Item_JunkMetal","Exile_Item_LightBulb","Exile_Item_CamoTentKit","Exile_Item_WorkBenchKit",
				"Exile_Item_MetalBoard","Exile_Item_MetalPole"
			    ];

_loot_launchers = [
			"launch_NLAW_F",
			"launch_RPG32_F",
			"launch_B_Titan_F",
			"launch_Titan_short_F"
			];
// Define functions
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// allows a visible cue to be spawned near the crate
_fn_smokeAtCrate = { // adapted from Ritchies heli crash addon
	private ["_pos","_smokeSource","_smokeTrail","_fire","_posFire","_smoke","_randomLocation","_px","_py"];

	// Use the Land_Fire_burning item if you want a bright visual cue at night but be forewarned that the flames are blinding with NVG at close range
	// http://www.antihelios.de/EK/Arma/index.htm
	_wrecks = ["Land_Wreck_Car2_F","Land_Wreck_Car3_F","Land_Wreck_Car_F","Land_Wreck_Offroad2_F","Land_Wreck_Offroad_F","Land_Tyres_F","Land_Pallets_F","Land_MetalBarrel_F"];
	_smokeSource = selectRandom _wrecks;  //other choices might be "Land_CanisterPlastic_F","Land_MetalBarrel_F", "Land_Pallets_F", "Land_Tyres_F", "Land_Wreck_Car2_F", "Land_HumanSkeleton_F", "Land_Wreck_Car2_F";
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
	
	_posFire = [_pos, 5, 15, 3, 0, 20, 0] call BIS_fnc_findSafePos;  // find a safe spot near the location passed in the call
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
	
	_cratePos = param[0]; //_this select 0;		
	_lootType = param[1,0]; //[_this, 1, 0] call BIS_fnc_param; // if a loot type is passed us this otherwise use a randomly selected loot type.
	_randomLocation = param[2,true]; //[_this, 2, true] call BIS_fnc_param;
	_useSmoke = param[3,false]; //[_this, 3, false] call BIS_fnc_param;
	_loadLaunchers = param[4,false];
	
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
	_selectedCrateType = selectRandom _crateTypes;	
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
			_crate_1 addMagazineCargoGlobal [selectRandom _loot_build, _items];
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
			_rifle = selectRandom _loot_rifles;
			//diag_log format["--->>> parameter _rifle is %1",_rifle];
			_crate_1 addWeaponCargoGlobal [_rifle select 0, 1];
			_crate_1 addMagazineCargoGlobal [_rifle select 1, (3 + floor(random 3))];
		};
		_noPistols = 3;
		for "_i" from 1 to _noPistols do
		{
			_pistol = selectRandom _loot_pistols;
			_crate_1 addWeaponCargoGlobal [_pistol select 0,1];
			_crate_1 addMagazineCargoGlobal [_pistol select 1, (3 + floor(random 3))];
		};
		_noLMG = 5;
		for "_i" from 1 to _noLMG do
		{
			_LMG = selectRandom _loot_LMG;
			_crate_1 addWeaponCargoGlobal [_LMG select 0,1];
			_crate_1 addMagazineCargoGlobal [_LMG select 1, (1 + floor(random 3))];
		};
		_noSniper = 4;
		for "_i" from 1 to _noSniper do
		{
			_sniper = selectRandom _loot_snipers;
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
		if (_add_launchers) then
		{
			_launchers = 3;
			for "_i" from 1 to _launchers do
			{
				_launcherSelected = selectRandom _loot_launchers;
				_crate_1 addWeaponCargoGlobal [_launcherSelected,1];
				for "_i" from 1 to 3 do
				{
					_launcherRound = getArray (configFile >> "CfgWeapons" >> _launcherSelected >> "magazines") select 0;
					_crate_1 addItemCargoGlobal [_launcherRound, 2];
				};
			};
		};
	};

	if (_lootType == 3) then
	{
		_noMiscTypes = 10;
		_maxNoEachItem = 10;
		for "_i" from 1 to _noMiscTypes do
		{
			_items = (round(random(_maxNoEachItem)));
			_partToAdd = selectRandom _loot_misc;
			//diag_log format["<<<<--- for loot type 3 number of parts is %1 and part is %2",_items,_partToAdd];
			_crate_1 addMagazineCargoGlobal [_partToAdd,_items];
		};
		//_crate_1 addWeaponCargoGlobal ["MultiGun",3];
		//_crate_1 addMagazineCargoGlobal ["EnergyPack",5];
		//_crate_1 addMagazineCargoGlobal ["EnergyPackLg",3];
		//_crate_1 addMagazineCargoGlobal ["ItemLockBox",2];
		//_crate_1 addMagazineCargoGlobal ["jerrycan_epoch",2];
		//_crate_1 addMagazineCargoGlobal ["ItemGoldBar10oz",2];
		//_crate_1 addMagazineCargoGlobal ["ItemSilverBar",4];
		//_crate_1 addMagazineCargoGlobal ["ItemKiloHemp",4];
 
	};

	if (_lootType == 4) then
	{
 
		_noRifles = 8;
		for "_i" from 1 to _noRifles do
		{
			_rifle = selectRandom _loot_rifles;
			//diag_log format["[random_crateLoot] -- >> _rifle contains  %1",_rifle];
			_weap = _rifle select 0;
			_ammo = _rifle select 1;
			_crate_1 addWeaponCargoGlobal [_weap, 1];
			_crate_1 addMagazineCargoGlobal [_ammo, (3 + floor(random 3))];
		};
		_noPistols = 3;
		for "_i" from 1 to _noPistols do
		{
			_pistol = selectRandom _loot_pistols;
			_crate_1 addWeaponCargoGlobal [_pistol select 0,1];
			_crate_1 addMagazineCargoGlobal [_pistol select 1, (3 + floor(random 3))];
		};
		_noLMG = 6;
		for "_i" from 1 to _noLMG do
		{
			_LMG = selectRandom _loot_LMG;
			_crate_1 addWeaponCargoGlobal [_LMG select 0,1];
			_crate_1 addMagazineCargoGlobal [_LMG select 1, (1 + floor(random 3))];
		};
		_noSniper = 4;
		for "_i" from 1 to _noSniper do
		{
			_sniper = selectRandom _loot_snipers;
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
			_crate_1 addItemCargoGlobal [(selectRandom _loot_vests),(1 + floor(random 1))];
		};
		_noHeadgear = 4;
		for "_i" from 1 to _noHeadgear do
		{
			_crate_1 addItemCargoGlobal [(selectRandom _loot_headgear),1];
		};
		_noBackpacks = 3;
		for "_i" from 1 to _noBackpacks do
		{
			_crate_1 addBackpackCargoGlobal [(selectRandom _loot_backpacks),(1 + floor(random 1))];
		};
		_noItemTypes = 6;
		for "_i" from 1 to _noItemTypes do
		{
			_items = round((_noItemTypes - _i)/2) + floor(random 1 + floor(_i/2));
			_crate_1 addMagazineCargoGlobal [selectRandom _loot_build, _items];
		};		
		if (_loadLaunchers) then
		{
			_launchers = 3;
			for "_i" from 1 to _launchers do
			{
				_launcherSelected = selectRandom _loot_launchers;
				_crate_1 addWeaponCargoGlobal [_launcherSelected,1];
				for "_i" from 1 to 3 do
				{
					_launcherRound = getArray (configFile >> "CfgWeapons" >> _launcherSelected >> "magazines") select 0;
					_crate_1 addItemCargoGlobal [_launcherRound, 2];
				};
			};
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
		_item = selectRandom _array;
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
	if (count _lootBoxes isEqualTo 0) exitWith {diag_log "[SLS]: No loot crates to spawn";};
	{
		_no = _x select 0;
		_ar = _x select 1;
		_cratePosnList = [_ar, _no] call _fn_selectRandomItemsFromArray;
		//diag_log format["--->>> Crate Spawner:: _cratePosnList = %1",_cratePosnList];
		{
			diag_log format["[blckeagls] SLS:: spawning crate --->>> %1",_x];
			_cratePos = _x select 0;  // get crate position
			_lootType= _x select 1;
			_randomPos = _x select 2;
			_useSmoke = _x select 3;
			_useLaunchers = _x param [4,false];
			[_cratePos,_lootType,_randomPos,_useSmoke,_useLaunchers] call _fn_SpawnCrate;
		} forEach _cratePosnList;
		
	} forEach _lootBoxes;
};

// Start everything up.
[] call _fn_Run;
blck_SLSComplete = true;
diag_log format["[blckeagls]  Static crates loaded for Exile in %1 seconds",(diag_tickTime - _startTime)];
blck_SLSComplete = true;