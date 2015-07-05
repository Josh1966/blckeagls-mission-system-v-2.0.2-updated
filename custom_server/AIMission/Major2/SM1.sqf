/*
  Spawn Green Mission
  Original Code by blckeagls
  Modified by Ghostrider
  See Major\SM1.sqf for comments
*/

private ["_coords","_crate","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos","_objects","_startMsg","_endMsg","_missionObjs","_compositions","_missionCfg","_compSel","_mines"];
diag_log "[blckeagls] Starting GREEN mission SM1";

_coords = _this select 0;
_objects = [];
_mines = [];

#include "\q\addons\custom_server\AIMission\Major2\compositions\compositionsGreen.sqf"; 

_compositions = 
[
	"resupplyCamp",
	"redCamp",
	"medicalCamp",
	"default"
];

_compSel = _compositions call BIS_fnc_selectRandom;
diag_log format["[blckeagls] Green Mission composition = %1 ",_compSel];
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

C2coords = _coords;

publicVariable "C2coords";
[] execVM "debug\addmarkers2.sqf";

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };

//Creates the crate
_crate = [_coords] call blck_spawnCrate;
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;
[_crate,blck_BoxesLoot_Major2,blck_lootCountsMajor2 select 0, blck_lootCountsMajor2 select 1, blck_lootCountsMajor2 select 2, blck_lootCountsMajor2 select 3, blck_lootCountsMajor2 select 4] call blck_fillBoxes;

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
_aiGroup = [_coords,blck_MinAI_Major2,blck_MaxAI_Major2,"green",blck_AIGrps_Major2,20,40] call blck_spawnGroups;
blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
if (blck_useStatic) then 
{
	if (blck_SpawnEmplaced_Major2  > 0) then
	{

		_aiGroup = [_coords,blck_SpawnEmplaced_Major2,35,50,"green"] call  blck_spawnEmplacedWeapon;
		//diag_log format["Major2\SM1.sqf: results returned by blck_spawnEmplacedWeapon are %1",_aiGroup];		
		blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
	};
};
if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Major2 > 0) then
	{
		_aiGroup = [_coords,blck_SpawnVeh_Major2,45,60,"green",3] call  blck_spawnVehiclePatrol;
		//diag_log format["Major2\SM1.sqf: results returned by blck_spawnVehiclePatrol are %1",_aiGroup];
		blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
	};
};
waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x  } count playableunits > 0};
[_mines] call blck_clearMines;
[_endMsg] call blck_MessagePlayers;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;
MissionGoMajor2 = false;
diag_log "[blckeagls] End of GREEN mission SM1";