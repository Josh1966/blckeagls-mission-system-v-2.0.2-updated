/*
  Code by blckeagls
  Modified by Ghostrider
  Everythign related to a spawning a Group happens here. 
*/
//Sets Private Variables to they don't interfere when this script is called more than once
private["_pos","_weaponlist","_ammolist","_skinlist","_itemlist","_randomNumberWeapon","_randomNumberSkin","_randomNumberItem","_numbertospawn","_whichweap","_whichitem","_whichskin","_weapon","_ammo","_item",
		"_skin","_i","_skillLevel","_aiGroup","_numai1","_numai2","_safepos","_wppos","_xpos","_ypos","_wpradius","_wpnum","_oldpos","_newpos","_x","_wp","_useLauncher","_launcherType"];	
		
//Gets variables passed from SM1.sqf
_pos = _this select 0;
_numai1 = [_this,1,5] call BIS_fnc_param;
_numai2 = [_this,2,10] call BIS_fnc_param;
_skillLevel = [_this,3,"blue"] call BIS_fnc_param; // "blue", "red", "green", "orange"
_emplacedWeapon = [_this, 4, "null"] call BIS_fnc_param;

//Spawns correct number of AI
if (_numai2 > _numai1) then {
	_numbertospawn = floor( (random (_numai2 - _numai1) + _numai1 ) );
} else {
	_numbertospawn = _numai2;
};

//Creates a group to make them attack players
_aiGroup = createGroup RESISTANCE;	
_aiGroup setcombatmode blck_combatMode;
_aiGroup allowfleeing 0;
_aiGroup setspeedmode "FULL";
_aiGroup setFormation blck_groupFormation; 

//Counter variable
_i = 0;

// Determines whether or not the group has launchers
_useLauncher = blck_useLaunchers;

// defin weapons for the group
switch (_skillLevel) do {
	case "blue": {_weaponList = blck_WeaponList_Blue;};
	case "red": {_weaponList = blck_WeaponList_Red;};
	case "green": {_weaponList = blck_WeaponList_Green;};
	case "orange": {_weaponList = blck_WeaponList_Orange;};
	default {_weaponList = blck_WeaponList_Blue;};
};

if (blck_debugON) then
{
	//diag_log format["spawnGroup.sqf --->>> _pos = %1 _numai1 = %2 _numai2 = %3 _skillLevel = %4 _emplacedWeapon = %5",_pos,_numai1,_numai2,_skillLevel,_emplacedWeapon];
	//diag_log format["[spawnGroup.sqf] <<<===>>>  _weaponList is %1",_weaponList];
	//diag_log format["[spawnGroup.sqf] <<<===>>>  _skillLevel = %1",_skillLevel];
};

//Spawns the correct number of AI Units
while {_i < _numbertospawn} do {
	_i = _i + 1;
	
	if (blck_useLaunchers) then {
		if (_i > blck_launchersPerGroup) then {
			_useLauncher = false;
		};
	};
	
	//Weapons Selects	
	_whichweap = _weaponList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this weapon array: %1",_whichweap];// For debug
	
	//assigns class name based on random number generated
	_weapon = _whichweap select 0;
	//diag_log format["AI Got this weapon: %1",_weapon];// For debug
	
	//This isnt reall needed anymore -- but it needs to have something passed
	_ammo = _whichweap select 1;
	//diag_log format["AI Got this weapon magazine: %1",_ammo];// For debug
	
	//Selects a random item from blck_AIItemList to add to the AI...
	_item = blck_AIItemList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this item: %1",_item];// For debug
	
	//diag_log format["selecting launcher ................[[[[[[[[[[[  _i = %1  _useLauncer = %2  ]]]]]]]]]]]]",_i,_useLauncher];
	if (_useLauncher) then 
	{
		_launcherType = blck_launcherTypes call BIS_fnc_selectRandom;
		if (blck_debugON) then
		{
			//diag_log format["spawnGroup.sqf] ---[Launcher selected] %1",_launcherType];
		};
	};
	if (!_useLauncher) then 
	{
		_launcherType = "none";
		if (blck_debugON) then
		{
			//diag_log format["[spawnGroup.sqf] No Launcher selected, _launcherType = %1",_launcherType];
		};
	};
	
	//Selects a random skin
	_skin = blck_SkinList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this skin: %1",_skin];// For debug
	
	//Finds a safe positon to spawn the AI in the area given
	_safepos = [_pos,0,27,1,0,2000,0] call BIS_fnc_findSafePos;
	
	//diag_log format["[spawnGroup.sqf] _skillLevel = %1",_skillLevel];	
	//Spawns the AI units
	[_safepos,_weapon,_ammo,_item,_skin,_aiGroup,_skillLevel,_launcherType] call blck_spawnAI;
	if (blck_debugON) then
	{
		//diag_log format["---<<<spawnGroup.sqf>>>--- this group contains the following units %1", units _aiGroup];
	};
};

// set movement, formation and waypoints
[_aiGroup] call blck_setupWaypoints;

// return the group spawned so that this can be used for mission clean up or triggers regarding completion
units _aiGroup;
