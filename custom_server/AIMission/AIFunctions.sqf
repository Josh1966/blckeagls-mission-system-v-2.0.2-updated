/*
	for the Mission System by blckeagls
	Modified by Ghostrider
	2-1-15 Updates: changed how number of weapons and magazines of corresponding ammo are calculated lines 89 amd 90
	Added a precompiled AIKilled routine.
	
	Functions and global variables that should not be modified are provided here
*/
blck_debugON = true;
	
blck_spawnGroup = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnGroup.sqf";
blck_spawnGroups = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnGroups.sqf";
blck_spawnAI = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnUnit.sqf";
//blck_spawnAIVehicle = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnVehicle.sqf";
blck_MessagePlayers = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIM.sqf";
blck_EH_AIKilled = "\q\addons\custom_server\AIMission\AIKilled.sqf"; //compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIKilled.sqf";
blck_setupWaypoints = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\setWaypoints.sqf";
blck_vehicleMonitor = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\vehicleMonitor.sqf";
blck_spawnEmplacedWeapon = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnEmplaced.sqf";
blck_spawnVehiclePatrol = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnVehicle.sqf";
blck_cleanupObjects = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\cleanUpObjects.sqf";
blck_spawnCompositionObjects = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\otl7_Mapper.sqf";
blck_fillBoxes = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\fillBoxes.sqf"; 
blck_smokeAtCrates = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\smokeAtCrate.sqf"; 
blck_removeGear = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\removeGear.sqf"; 
blck_spawnCrate = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnCrate.sqf"; 
blck_spawnMines = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnMines.sqf"; 
blck_clearMines = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\clearMines.sqf"; 
blck_FindSafePosn = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\findSafePosn.sqf"; 
blck_playerGetInAIVehicle = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\decomissionAIVehicle.sqf";
blck_EH_vehicleHit = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\decomissionAIVehicle.sqf";
//Minimum distance for AI To spawn away form another AI
MinDistanceFromMission = 1000;
	
// Define map marker coordinates
Ccoords = [0,0,0];
C2coords = [0,0,0];
MCoords = [0,0,0];
M2Coords = [0,0,0];

//sets Mission Variables
MissionGoMajor = false;
MissionGoMajor2 = false;
MissionGoMinor = false;
MissionGoMinor2 = false;
AllMissionCoords = [];

// Arrays for use during cleanup of alive AI at some time after the end of a mission
blck_AIMajor = [];
blck_AIMajor2 = [];
blck_AIMinor = [];
blck_AIMinor2 = [];

blck_cleanupCompositionTimer = 900;  // Time after mission completion at which items in the composition are deleted.
blck_AICleanUpTimer = 600;  // Time after mission completion at which any remaining live AI are deleted.

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
blck_TriggerDistance = 1000;

// wait for a random period within the range defined by _min, _max
blck_waitTimer = {
	// Call as
	//[_minTime, _maxTime] call blck_waitTimer
	// Returns true; 
	//can be used in waitUntil {[_minTime, _maxTime] call blck_waitTimer};
	private["_min","_max","_wait","_Tstart"];
	_min = _this select 0;
	_max = _this select 1;	
	_wait = round(_min + (_max - _min));
	_Tstart = diag_tickTime;
	 waitUntil{sleep 5;(diag_tickTime - _Tstart) > _wait;};
	true
};

// Its purpose is to delete any alive AI associated with a completed mission.
// one passes an array of units
blck_AICleanup = {
	private ["_ai","_group","_aiGroups","_aiUnits"];

	if (count _this < 1) exitWith {diag_log "----<<<<  function blck_UnitsCleanup >>>---- no parameters passed";};
	_aiUnits = _this select 0;
	sleep blck_AICleanUpTimer;
	if (count _aiUnits >= 1) then {
		{
			//diag_log format["---->>>> blckAICleanup Group of unit to be deleted is %1 and its unit count is %2", group _x, count units group _x];
			deleteVehicle _x;
		} forEach _aiUnits;
	};
};

// Self explanatory
blck_setSkill = {
	// [_group, _skill] call blck_setSkill;
	private ["_unit","_skillsArrray"];
	
	_unit = _this select 0;
	_skillsArrray = _this select 1;

	{
		_unit setSkill [(_x select 0),(_x select 1)];
	} forEach _skillsArrray;
};

diag_log "[blckeagls] Functions Loaded";
