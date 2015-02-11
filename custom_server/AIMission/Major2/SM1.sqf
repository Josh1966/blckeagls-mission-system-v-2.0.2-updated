/*
  Code by blckeagls
  Modified by Ghostrider
  See Major\SM1.sqf for comments
*/

private ["_coords","_crate","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos"];
diag_log "[blckeagls] Starting GREEN mission SM1";

_coords = _this select 0;

["A group of AI was sighted ! Check the Green marker on your map for the location!"] call blck_MessagePlayers;

C2coords = _coords;
_skill = 2;
publicVariable "C2coords";
[] execVM "debug\addmarkers2.sqf";

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };

_crate = objNull;
_crate = createVehicle ["Box_NATO_Wps_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate setVariable ["Mission",1,true];
_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true,true];

[_crate,blck_BoxesLoot_Major2,blck_lootCountsMajor2 select 0, blck_lootCountsMajor2 select 1, blck_lootCountsMajor2 select 2] call blck_fillBoxes;

_numAIGrp = round((blck_MinAI_Major2 + round(random(blck_MaxAI_Major2 - blck_MinAI_Major2)))/blck_AIGrps_Major2);
_arc = 360/blck_AIGrps_Major2;
_dir = random 360;
_dist = (20+(random 15));
for "_i" from 1 to blck_AIGrps_Major2 do {
	_dist = (20+(random 15));
	_xpos = (_coords select 0) + sin (_dir) * _dist;
	_ypos = (_coords select 1) + cos (_dir) * _dist;
	_newPos = [_xpos,_ypos,0];
	_aiGroup = [_newPos,_numAIGrp,_numAIGrp+1,blck_WeaponList_Major2,blck_SkillsGreen] call blck_spawnGroup;
	blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
	_dir = _dir + _arc;
};
if (blck_SpawnVeh_Major2 > 0) then {
	_aiGroup = [_coords,blck_SpawnVeh_Major2] call blck_spawnAIVehicle;
	blck_AIMajor = blck_AIMajor + _aiGroup;
};
waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x  } count playableunits > 0};
["The Sector at the Green Marker is under survivor control!"] call blck_MessagePlayers;

MissionGoMajor2 = false;