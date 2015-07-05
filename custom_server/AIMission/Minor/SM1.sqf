/*
 Spawn Blue
  Original Code by blckeagls
  Modified by Ghostrider
  See \Major\SM1.sqf for comments  
*/

private ["_coords","_crate","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos","_objects","_startMsg","_endMsg","_missionObjs","_compositions","_missionCfg","_compSel","_mines"];
diag_log "[blckeagls] Starting BLUE mission SM1";

_coords = _this select 0;
_objects = [];
_mines = [];

#include "\q\addons\custom_server\AIMission\Minor\compositions\compositionsBlue.sqf"; 

_compositions = 
[
	"resupplyCamp",
	"redCamp",
	//"medicalCamp",
	"default"
];

_compSel = _compositions call BIS_fnc_selectRandom;
diag_log format["[blckeagls] Blue Mission composition = %1 ",_compSel];
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
// Spawn composition objects
_objects = [_coords, round(random(360)),_missionObjs,true] call blck_spawnCompositionObjects;

[_crate,blck_BoxesLoot_Minor, blck_lootCountsMinor select 0, blck_lootCountsMinor select 1, blck_lootCountsMinor select 2, blck_lootCountsMinor select 3, blck_lootCountsMinor select 4] call blck_fillBoxes;

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
_aiGroup = [_coords,blck_MinAI_Minor,blck_MaxAI_Minor,"blue",blck_AIGrps_Minor,20,40] call blck_spawnGroups;
blck_AIMinor = blck_AIMinor + _aiGroup;
if (blck_useStatic) then 
{
	if (blck_SpawnEmplaced_Minor  > 0) then
	{

		_aiGroup = [_coords,blck_SpawnEmplaced_Minor,35,50,"blue"] call  blck_spawnEmplacedWeapon;
		//diag_log format["Minor\SM1.sqf: results returned by blck_spawnEmplacedWeapon are %1",_aiGroup];		
		blck_AIMinor = blck_AIMinor + _aiGroup;
	};
};
if (blck_useVehiclePatrols) then 
{
	if (blck_SpawnVeh_Minor > 0) then
	{
		_aiGroup = [_coords,blck_SpawnVeh_Minor,45,60,"blue",3] call  blck_spawnVehiclePatrol;
		//diag_log format["Minor\SM1.sqf: results returned by blck_spawnVehiclePatrol are %1",_aiGroup];
		blck_AIMinor = blck_AIMinor + _aiGroup;
	};
};
waitUntil{{isPlayer _x && _x distance _crate < 20 && vehicle _x == _x  } count playableunits > 0};
[_mines] call blck_clearMines;
[_objects, blck_cleanupCompositionTimer] spawn blck_cleanupObjects;
[_endMsg] call blck_MessagePlayers;
diag_log "[blckeagls] End of BLUE mission SM1";
MissionGoMinor = false;
