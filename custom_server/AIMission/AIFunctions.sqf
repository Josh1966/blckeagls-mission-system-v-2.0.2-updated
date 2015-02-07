/*
	for the Mission System by blckeagls
	Modified by Ghostrider
	2-1-15 Updates: changed how number of weapons and magazines of corresponding ammo are calculated lines 89 amd 90
	Added a precompiled AIKilled routine.
*/
private ["_blck_WorldName"];

blck_spawnGroup = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\spawnai.sqf";
blck_spawnAI = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AI1.sqf";

blck_MessagePlayers = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIM.sqf";
blck_AIKilled = compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIKilled.sqf";

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

// self explanatory. Checks to see if the position is in either a black listed location or near a player spawn. 
// As written this relies on BIS_fnc_findSafePos to ensure that the spawn point is not on water or an excessively steep slope. 
// The parameter for slope needs verification
blck_FindSafePosn = {
	private["_findNew","_coords"];
	_findNew = true;
	while {_findNew} do {
		_findNew = false;
		//[_centerForSearch,_minDistFromCenter,_maxDistanceFromCenter,_minDistanceFromNearestObj,_waterMode,_maxTerainGradient,_shoreMode] call BIS_fnc_findSafePos
		// https://community.bistudio.com/wiki/BIS_fnc_findSafePos
		_coords = [blck_mapCenter,0,blck_mapRange,30,0,10,0] call BIS_fnc_findSafePos;
		{
			if ((_x distance _coords) < MinDistanceFromMission) then {
				_FindNew = true;
			};
		} forEach AllMissionCoords;
		{
			if ((_x select 0 distance _coords) < _x select 1) then {
				_FindNew = true;
			};
		} forEach blck_locationBlackList;
	};
	_coords;
};

// Its purpose is to delete any alive AI associated with a completed mission.
// one passes an array of units
blck_AICleanup = {
	private ["_ai","_group","_aiGroups","_aiUnits"];

	if (count _this < 1) exitWith {diag_log "----<<<<  function blck_UnitsCleanup >>>---- no parameters passed";};
	_aiUnits = _this select 0;
	sleep blck_aiCleanUpTimer;
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
	private ["_group","_skillsArrray","_aiunits","_unit"];
	
	_group = _this select 0;
	_skillsArrray = _this select 1;
	_aiunits = units _group;
	for [{_i=0}, {_i < count _aiunits}, {_i=_i+1}] do {
		_unit = _aiunits select _i;
		{
			_unit setSkill [(_x select 0),(_x select 1)];
		} forEach _skillsArrray;
	};
};

// 
blck_fillBoxes = {
	private["_crate","_boxLoot","_wepCnt","_magCnt","_itemCnt","_a1","_item","_low","_high","_diff"];

	_crate = _this select 0;
	_boxLoot = _this select 1; // Array of [[weapons],[magazines],[items]]
	_wepCnt = _this select 2; // number of types of weapons to load
	_magCnt = _this select 3; // Number of types of additional, optional magazines to add (this includes building supplies)
	_itemCnt = _this select 4; // number of items (first aid packs, multigun bits) to load

	clearWeaponCargoGlobal _crate;
	clearMagazineCargoGlobal _crate;
	
	_a1 = _boxLoot select 0; // choose the subarray of weapons and corresponding magazines
	// Add some randomly selected weapons and corresponding magazines
	for "_i" from 1 to _wepCnt do {
		_item = _a1 call BIS_fnc_selectRandom;
		_crate addWeaponCargoGlobal [_item select 0,1];
		_crate addMagazineCargoGlobal [_item select 1, 1 + round(random(3))];
	};
	// Add Magazines, which includes building supplies, grenades, and 40mm grenade shells
	_a1 = _boxLoot select 1;
	for "_i" from 0 to _magCnt do {
		_item = _a1 call BIS_fnc_selectRandom;
		_diff = (_item select 2) - (_item select 1);  // Take difference between max and min number of items to load and randomize based on this value
		_crate addMagazineCargoGlobal [_item select 0, (_item select 1) + _diff];
	};
	// Add Items (first aid kits, multitool bits, vehicle repair kits, food and drinks)
	_a1 = _boxLoot select 2;
	for "_i" from 0 to _itemCnt do {
		_item = _a1 call BIS_fnc_selectRandom;
		_diff = (_item select 2) - (_item select 1); 
		_crate additemCargoGlobal [_item select 0, (_item select 1) + _diff];		
	};	
};

diag_log "[blckeagls] Functions Loaded";
