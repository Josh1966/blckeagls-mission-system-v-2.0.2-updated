/*
  Minor Mission 1
  Code by blckeagls
  Modified by Ghostrider
  See \Major\SM1.sqf for comments  
*/

private ["_coords","_crate","_aiGroup","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos"];
diag_log "[blckeagls] Starting BLUE mission SM1";

_coords = _this select 0;

["A group of AI was sighted ! Check the Blue marker on your map for the location!"] call blck_MessagePlayers;

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };

_crate = objNull;
_crate = createVehicle ["Box_NATO_Wps_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate setVariable ["Mission",1,true];
_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true,true];

[_crate,blck_BoxesLoot_Minor,blck_lootCountsMinor select 0, blck_lootCountsMinor select 1, blck_lootCountsMinor select 2] call blck_fillBoxes;

_numAIGrp = round((blck_MinAI_Minor + round(random(blck_MaxAI_Minor - blck_MinAI_Minor)))/blck_AIGrps_Minor);
_arc = 360/blck_AIGrps_Minor;
_dir = random 360;
_dist = (20+(random 15));
for "_i" from 1 to blck_AIGrps_Minor do {
	_numAIGrp = round((blck_MinAI_Minor + round(random(blck_MaxAI_Minor - blck_MinAI_Minor)))/blck_AIGrps_Minor);
	_dist = (20+(random 15));
	_xpos = (_coords select 0) + sin (_dir) * _dist;
	_ypos = (_coords select 1) + cos (_dir) * _dist;
	_newPos = [_xpos,_ypos,0];
	_aiGroup = [_newPos,_numAIGrp,_numAIGrp+1,blck_WeaponList_Minor,blck_SpawnVeh_Minor, blck_SkillsBlue] call blck_spawnGroup;
	blck_AIMinor = blck_AIMinor + _aiGroup;
	_dir = _dir + _arc;
};

waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x  } count playableunits > 0};
["The Sector at the Blue Marker is under survivor control!"] call blck_MessagePlayers;

MissionGoMinor = false;