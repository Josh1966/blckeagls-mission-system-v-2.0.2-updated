/*
  Code by blckeagls
  Modified by Ghostrider
*/
//Sets Private Variables to they don't interfere when this script is called more than once
private["_pos","_weaponlist","_ammolist","_skinlist","_itemlist","_randomNumberWeapon","_randomNumberSkin","_randomNumberItem","_numbertospawn","_whichweap","_whichitem","_whichskin","_weapon","_ammo","_item",
		"_skin","_i","_skill","_aiGroup","_numai1","_numai2","_safepos","_wppos","_xpos","_ypos","_wpradius","_wpnum","_oldpos","_newpos","_x","_wp"];	
		
//Gets variables passed from SM1.sqf
_pos = _this select 0;
_numai1 = _this select 1;
_numai2 = _this select 2;
_weaponList = _this select 3;  // Array with weapons which can be used to equip the AI 
_skill = _this select 4; // Array of AI skills

//diag_log format["[blackeagls] spawnai.sqf _skill is set to %1",_skill];

//Spawns correct ammount of AI
if (_numai2 > _numai1) then {
	_numbertospawn = floor( (random (_numai2 - _numai1) + _numai1 ) );
} else {
	_numbertospawn = _numai2;
};

//Creates a group to make them attack players
_aiGroup = createGroup RESISTANCE;	
//diag_log format["[blckeagls] AI1.sqf _skill is %1",_skill];

// Moved this from spawnai.sqf because we only need to define it once for each group
_aiGroup setcombatmode blck_combatMode;
_aiGroup allowfleeing 0;
_aiGroup setspeedmode "FULL";
_aiGroup setFormation blck_groupFormation; 
//Counter variable
_i = 0;

//Spawns the correct number of AI Units
while {_i < _numbertospawn} do {
	_i = _i + 1;
	
	
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
	
	//Selects a random skin
	_skin = blck_SkinList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this skin: %1",_skin];// For debug
	
	//Finds a safe positon to spawn the AI in the area given
	_safepos = [_pos,0,27,1,0,2000,0] call BIS_fnc_findSafePos;
	
	//Spawns the AI units
	[_safepos,_weapon,_ammo,_item,_skin,_aiGroup,_skill] call blck_spawnAI;
	//diag_log format["---<<<spawnai.sqf>>>--- this group contains the following units %1", units _aiGroup];
};

// Set the skill of the AI
[_aiGroup,_skill] call blck_setSkill;

_aiGroup setSpeedMode (["FULL","NORMAL","LIMITED"]call BIS_fnc_selectRandom);
_aiGroup setFormation (["WEDGE","VEE","FILE","DIAMOND"]call BIS_fnc_selectRandom);

_wpradius = 20;
_wpnum = 6;
_oldpos = _pos;
_newpos = _oldpos;
	
//Set up waypoints for our AI
for [{ _x=1 },{ _x < _wpnum },{ _x = _x + 1; }] do {
	while{_oldPos distance _newPos < 30}do{ 
			sleep .1;
			_dir = random 360;
			_dist = (15+(random 45));
			_xpos = (_pos select 0) + sin (_dir) * _dist;
			_ypos = (_pos select 1) + cos (_dir) * _dist;
			_newPos = [_xpos,_ypos,0];
	};	
	_oldPos = _newPos;	
	_wppos = [_xpos,_ypos];
	_wp = _aiGroup addWaypoint [_wppos, _wpradius];
	_wp setWaypointType "MOVE";
};
_wp = _aiGroup addWaypoint [[_xpos,_ypos,0], _wpradius];
_wp setWaypointType "CYCLE";
	
// return the group spawned so that this can be used for mission clean up or triggers regarding completion
units _aiGroup;
