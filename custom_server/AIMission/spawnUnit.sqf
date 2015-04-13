/*
	Code by blckeagls
	Modified by Ghostrider
	Code to delete dead AI bodies moved to AIKilled.sqf
	Everything having to do with spawning and configuring an AI should happen here
*/

//Defines private variables so they don't interfere with other scripts
private ["_pos","_i","_weap","_ammo","_other","_skin","_aiGroup","_ai1","_magazines","_players","_owner","_ownerOnline","_nearEntities","_skillLevel","_aiSkills","_Launcher","_launcherRound","_Vests","_vest","_index"];

_Vests = [
"V_1_EPOCH","V_2_EPOCH","V_3_EPOCH","V_4_EPOCH","V_5_EPOCH","V_6_EPOCH","V_7_EPOCH","V_8_EPOCH","V_9_EPOCH","V_10_EPOCH","V_11_EPOCH","V_12_EPOCH","V_13_EPOCH","V_14_EPOCH","V_15_EPOCH","V_16_EPOCH","V_17_EPOCH","V_18_EPOCH","V_19_EPOCH","V_20_EPOCH","V_21_EPOCH","V_22_EPOCH","V_23_EPOCH","V_24_EPOCH","V_25_EPOCH","V_26_EPOCH","V_27_EPOCH","V_28_EPOCH","V_29_EPOCH","V_30_EPOCH","V_31_EPOCH","V_32_EPOCH","V_33_EPOCH","V_34_EPOCH","V_35_EPOCH","V_36_EPOCH","V_37_EPOCH","V_38_EPOCH","V_39_EPOCH","V_40_EPOCH"
];

//Gets variables passed from spawnai.sqf/spawnai1.sqf
_pos = _this select 0;  // Position at which to spawn AI
_weap = _this select 1;  // Weapon to give AI
_ammo = _this select 2;  // Ammo to give AI
_other = _this select 3;  // Other stuff to give AI
_skin = _this select 4;  // Skin to give AI
_aiGroup = _this select 5;  // Group to which AI belongs
_skillLevel = [_this,6,"blue"] call BIS_fnc_param;   // "blue", "red", "green", "orange"
_Launcher = _this select 7; // If true then add a launcher to the unit

//Creating the AI Unit
_ai1 = ObjNull;
//Creates the AI unit from the _skin passed to it
"i_g_soldier_unarmed_f" createUnit [_pos, _aiGroup, "_ai1 = this", 0.7, "COLONEL"];
//Cleans the AI to a fresh spawn
removeBackpackGlobal _ai1;
removeAllItemsWithMagazines  _ai1;
//_ai1 AddUniform _skin;
_ai1 forceAddUniform _skin;

//Stops the AI from being cleaned up
_ai1 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai1 setVariable["LAST_CHECK",1000000000000];

//Sets AI Skills
_ai1 enableAI "TARGET";
_ai1 enableAI "AUTOTARGET";
_ai1 enableAI "MOVE";
_ai1 enableAI "ANIM";
_ai1 enableAI "FSM";
_ai1 allowDammage true;
_ai1 setBehaviour "COMBAT";
_ai1 setunitpos "AUTO";
_ai1 setVariable ["Engaged", 0, true];

sleep 1; //For some reason without this sometimes they don't spawn the weapon on them

// Add a vest to AI for storage
_vest = _Vests call BIS_fnc_selectRandom;
_ai1 addVest _vest;

if (_Launcher == "none") then
{
	if (blck_debugON) then 
	{
	};
};
if (_Launcher != "none") then
{
	_launcherRound = getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines") select 0;
	for "_i" from 1 to 3 do 
	{
		_ai1 addItemToVest _launcherRound;
	};
	_ai1 addWeaponGlobal _Launcher;
};

//Adds 5 magazines to AI Unit
_ai1 addMagazine [_ammo,5];

// Add items to the AI unit
_i = 0;
while {_i < 4} do {
	_i = _i + 1;
	_ai1 addItem _ammo;
};

//Adds the weapon specified to it from spawnai.sqf/spawnai1.sqf
_ai1 addWeaponGlobal  _weap; 

sleep 1; //For some reason without this sometimes they don't spawn the weapon on them


//adds items to AI.  _other = ["ITEM","COUNT"]
_i = 0;
while {_i < (_other select 1)} do {
	_i = _i + 1;
	_ai1 addItem (_other select 0)
};
if (blck_debugON) then
{
	//diag_log format["[spawnUnit.sqf >>> Vest selected was %1",_vest];
	//diag_log format["[spawnUnit.sqf Debug] Launcher parameter is %1",_Launcher];
	//diag_log format["[spawnUnits.sqf begin] --- Unit weapons are %1", weapons _ai1];
	//diag_log format["[spawnUnits.sqf begin ] --- Unit magazines are %1",magazines _ai1];
	//diag_log format["[spawnUnits.sqf begin ] --- Unit muzzle is %1", currentMuzzle _ai1];
	//diag_log format["[spawnUnits.sqf begin ] --- _skillLevel %1", _skillLevel];	
};

// Infinite ammo
_ai1 addeventhandler ["fired", {(_this select 0) setvehicleammo 1;}];

// Do something if AI is killed
_ai1 addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] execVM blck_AIKilled; }]; // changed to reduce number of concurrent threads, but also works as spawn blck_AIKilled; }];

_index = 0;

switch (_skillLevel) do 
{
	case "blue": {_index = 0;_aiSkills = blck_SkillsBlue;};
	case "red": {_index = 1;_aiSkills = blck_SkillsRed;};
	case "green": {_index = 2;_aiSkills = blck_SkillsGreen;};
	case "orange": {_index = 3;_aiSkills = blck_SkillsOrange;};
	default {_index = 0;_aiSkills = blck_SkillsBlue;};
};

_alertDist = blck_AIAlertDistance select _index; 
_intelligence = blck_AIIntelligence select _index;


[_ai1,_aiSkills] call blck_setSkill;
_ai1 setVariable ["alertDist",_alertDist,true];
_ai1 setVariable ["intelligence",_intelligence,true];

if (blck_debugON) then
{
//diag_log format["[spawnUnit.sqf] -->> aiSkills are %1",_aiSkills];
//diag_log format["[spawnUnit.sqf] -->> alertDist = %1 and intelligence = %2",_alertDist,_intelligence];
//diag_log "=============================================================================================";
};

_ai1