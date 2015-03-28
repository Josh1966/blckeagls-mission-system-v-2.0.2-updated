/*
  Code by blckeagls
  Modified by Ghostrider
*/
private ["_coords","_MainMarker","_wait","_crate","_aiGroup","_timeDiff","_timeVar","_wait","_startTime","_allAIGroups","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos"];
diag_log "[blckeagls] Starting ORANGE mission SM1";

_coords = _this select 0;

//Sends message to all players about the AI Mission
["A group of AI was sighted ! Check the Orange marker on your map for the location!"] call blck_MessagePlayers;

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };

//Creates the crate
_crate = objNull;
_crate = createVehicle ["Box_NATO_Wps_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];

//Sets variables (not sure if needed but left just incase so cleanup doesnt happen
_crate setVariable ["Mission",1,true];
_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true,true];

//Fills the crate with items
// Parameters here are [_crate, _lootArray, num weapons to add, num items from the magazines array to add, num items from the item array to add]
// Variables are: 
//	blck_BoxLoot_Major, an array of items which can be added to the crate; 
//	blck_lootCountsMajor, an array containing the number of weapons, magazines, items and backpacks to be randomly selected from blck_BoxLoot_Major and added to the crate

[_crate,blck_BoxLoot_Major,blck_lootCountsMajor select 0, blck_lootCountsMajor select 1, blck_lootCountsMajor select 2, blck_lootCountsMajor select 3] call blck_fillBoxes;

//Spawns the AI at several randomized locations relative to the loot box
_numAIGrp = round((blck_MinAI_Major + round(random(blck_MaxAI_Major - blck_MinAI_Major)))/blck_AIGrps_Major);
_arc = 360/blck_AIGrps_Major;
_dir = random 360;
_dist = (20+(random 15));
for "_i" from 1 to blck_AIGrps_Major do {
	_dist = (20+(random 15));
	_xpos = (_coords select 0) + sin (_dir) * _dist;
	_ypos = (_coords select 1) + cos (_dir) * _dist;
	_newPos = [_xpos,_ypos,0];
	_aiGroup = [_newPos,_numAIGrp,_numAIGrp+1,blck_WeaponList_Major,blck_SkillsBlack] call blck_spawnGroup;
	//diag_log format["----->>>>> Orange Mission _aiGroup returned as type %1 with values of %2", typeName _aiGroup, _aiGroup];
	blck_AIMajor = blck_AIMajor + _aiGroup;
	_dir = _dir + _arc;
};
if (blck_SpawnVeh_Major > 0) then {
	_aiGroup = [_coords,blck_SpawnVeh_Major] call blck_spawnAIVehicle;
	blck_AIMajor = blck_AIMajor + _aiGroup;
};
//Waits until player gets near the _crate to end mission
waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x } count playableunits > 0};

//Announces that the mission is complete
["The Sector at the Orange Marker is under survivor control!"] call blck_MessagePlayers;

MissionGoMajor = false;
