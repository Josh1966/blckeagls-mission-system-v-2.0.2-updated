/*
  Spawn Orange Mission
  Original Code by blckeagls
  Modified by Ghostrider
*/
private ["_coords","_crate","_aiGroup","_numAIGrp","_objects","_startMsg","_endMsg","_mapLabel","_missionObjs","_compositions","_missionCfg","_compSel","_mines","_result"];
diag_log "[blckeagls] Starting ORANGE mission SM1";

_coords = _this select 0;
// holds a list of objects spawned for this mission for cleanup later on.
_objects = [];
_mines = [];

// Use include here so as not to distract from the flow of the code. The included file defines arrays specifying the parameters for each mission.
#include "\q\addons\custom_server\AIMission\Major\compositions\compositionsOrange.sqf"; 

// a listing of mission compositions for this mission set.
_compositions = 
[
	"resupplyCamp",
	"redCamp",
	"medicalCamp",
	"default"
];

_compSel = _compositions call BIS_fnc_selectRandom;
diag_log format["[blckeagls] Orange Mission composition = %1 ",_compSel];
// Select a mission configuration and load the data into _missionCfg
switch (_compositions call BIS_fnc_selectRandom) do 
{
	case "default": {_missionCfg = _default};
	case "medicalCamp": {_missionCfg = _medicalCamp};
	case "redCamp": {_missionCfg = _redCamp};
	case "resupplyCamp": {_missionCfg = _resupplyCamp};
};

// Parse the _missionCfg into messages and a list of objects for clarity of code
_startMsg = _missionCfg select 0 select 0;
_endMsg = _missionCfg select 0 select 1;
_missionObjs = _missionCfg select 1;

//Sends message to all players about the AI Mission

[_startMsg] call blck_MessagePlayers;

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };

//Creates the crate
_crate = [_coords] call blck_spawnCrate;
//Spawns the objects in the composition
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;

if (blck_useSmokeAtCrates) then  // spawn a fire and smoke near the crate
{
	private ["_temp"];
	_temp = [_coords] call blck_smokeAtCrates;
	_objects = _objects + _temp;
};

if (blck_useMines) then
{
	_mines = [_coords] call blck_spawnMines;
};

//Fills the crate with items
// Parameters here are [_crate, _lootArray, num weapons to add, num items from the magazines array to add, num items from the item array to add]
// Variables are: 
//	blck_BoxLoot_Major, an array of items which can be added to the crate; 
//	blck_lootCountsMajor, an array containing the number of weapons, magazines, items and backpacks to be randomly selected from blck_BoxLoot_Major and added to the crate

[_crate,blck_BoxLoot_Major,blck_lootCountsMajor select 0, blck_lootCountsMajor select 1, blck_lootCountsMajor select 2, blck_lootCountsMajor select 3, blck_lootCountsMajor select 4] call blck_fillBoxes;

_aiGroup = [_coords,blck_MinAI_Major,blck_MaxAI_Major,"orange",blck_AIGrps_Major,20,40] call blck_spawnGroups;
blck_AIMajor = blck_AIMajor + _aiGroup;

// Spawn any static weapons and man them

if (blck_useStatic) then 
{
	if (blck_SpawnEmplaced_Major > 0) then
	{
		_aiGroup = [_coords,blck_SpawnEmplaced_Major,35,50,"orange"] call  blck_spawnEmplacedWeapon;
		//diag_log format["Major\SM1.sqf: results returned by blck_spawnEmplacedWeapon are %1",_aiGroup];
		blck_AIMajor = blck_AIMajor + _aiGroup;
	};
};
if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Major > 0) then
	{
		_aiGroup = [_coords,blck_SpawnVeh_Major,45,60,"orange",3] call  blck_spawnVehiclePatrol;
		//diag_log format["Major\SM1.sqf: results returned by blck_spawnVehiclePatrol are %1",_aiGroup];
		blck_AIMajor = blck_AIMajor + _aiGroup;
	};
};
//Waits until player gets near the _crate to end mission
waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x } count playableunits > 0};
[_mines] call blck_clearMines;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;

//Announces that the mission is complete
[_endMsg] call blck_MessagePlayers;
diag_log "[blckeagls] End of ORANGE mission SM1";
MissionGoMajor = false;
