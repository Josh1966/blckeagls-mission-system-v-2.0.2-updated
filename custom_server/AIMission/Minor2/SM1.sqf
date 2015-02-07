/*
  Minor Mision2
  Code by blckeagls
  Modified by Ghostrider
*/
//See Major/SM1.sqf for comments
private ["_coords","_MainMarker","_wait","_crate","_aiGroup","_allAIGroups","_numAIGrp","_arc","_dir","_dist","_xpos","_ypos","_newPos"];
diag_log "[blckeagls] Starting RED mission SM1";

_coords = _this select 0;

["A group of AI was sighted !  Check the Red marker on your map for the location!"] call blck_MessagePlayers;
waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };
_crate = objNull;
_crate = createVehicle ["Box_NATO_Wps_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate setVariable ["Mission",1,true];
_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true,true];

[_crate,blck_BoxesLoot_Minor2,blck_lootCountsMinor2 select 0,blck_lootCountsMinor2 select 1,blck_lootCountsMinor2 select 2] call blck_fillBoxes;

_numAIGrp = round((blck_MinAI_Minor2 + round(random(blck_MaxAI_Minor2 - blck_MinAI_Minor2)))/blck_AIGrps_Minor2);
_arc = 360/blck_AIGrps_Minor2;
_dir = random 360;
_dist = (20+(random 15));
for "_i" from 1 to blck_AIGrps_Minor2 do {
	_dist = (20+(random 15));
	_xpos = (_coords select 0) + sin (_dir) * _dist;
	_ypos = (_coords select 1) + cos (_dir) * _dist;
	_newPos = [_xpos,_ypos,0];
	_aiGroup = [_newPos,_numAIGrp,_numAIGrp+1,blck_WeaponList_Minor2,blck_SpawnVeh_Minor2, blck_SkillsRed] call blck_spawnGroup;
	blck_AIMinor2 = blck_AIMinor2 + _aiGroup;
	_dir = _dir + _arc;
};

waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x  } count playableunits > 0};
["The Sector at the Red Marker is under survivor control!"] call blck_MessagePlayers;
MissionGoMinor2 = false;
