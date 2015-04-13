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

publicVariable "C2coords";
[] execVM "debug\addmarkers2.sqf";

waitUntil{ {isPlayer _x && _x distance _coords <= blck_TriggerDistance /*&& vehicle _x == _x*/} count playableunits > 0 };

_crate = objNull;
_crate = createVehicle ["Box_NATO_Wps_F",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
_crate setVariable ["Mission",1,true];
_crate setVariable ["ObjectID","1",true];
_crate setVariable ["permaLoot",true,true];

[_crate,blck_BoxesLoot_Major2,blck_lootCountsMajor2 select 0, blck_lootCountsMajor2 select 1, blck_lootCountsMajor2 select 2, blck_lootCountsMajor2 select 3] call blck_fillBoxes;

_numAIGrp = round((blck_MinAI_Major2 + round(random(blck_MaxAI_Major2 - blck_MinAI_Major2)))/blck_AIGrps_Major2);
_arc = 360/blck_AIGrps_Major2;
_dir = random 360;
_dist = (20+(random 15));
for "_i" from 1 to blck_AIGrps_Major2 do {
	_dist = (20+(random 15));
	_xpos = (_coords select 0) + sin (_dir) * _dist;
	_ypos = (_coords select 1) + cos (_dir) * _dist;
	_newPos = [_xpos,_ypos,0];
	_aiGroup = [_newPos,_numAIGrp,_numAIGrp+1,"green"] call blck_spawnGroup;
	blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
	_dir = _dir + _arc;
};
if (blck_useStatic) then 
{
	diag_log format["GREEN MISSION blck_useStatic is true and blck_SpawnVeh_Major2 is %1",blck_SpawnVeh_Major2];
	if (blck_SpawnVeh_Major2 == 1) then
	{
		diag_log "GREEN MISSION blck_useStatic is == 1";
		_aiGroup = [_coords,3,4,"GREEN"] call blck_spawnGroup;
		blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
		// spawn a static MG at the crate order the group to man it.
		diag_log format["GREEN MISSION Static Group contains %1",_aiGroup];
		diag_log format["GREEN MISSION Static Group is %1", _aiGroup select 0];
		[_coords,_aiGroup,blck_staticWeapons call BIS_fnc_selectRandom] call blck_spawnEmplacedWeapon;
		diag_log "GREEN MISSION stationary weapon spawned";
	};
	if (blck_SpawnVeh_Major2 > 1) then
	{
		diag_log "GREEN MISSION blck_useStatic is > 1";
		_arc = 360/blck_SpawnVeh_Major2;
		_dir = random 360;
		_dist = (15+(random 10));
		for "_i" from 1 to blck_SpawnVeh_Major2 do
		{ 
			_dir = _dir + _arc;
			if (_dir > 360) then {_dir = _dir - 360};
			_xpos = (_coords select 0) + sin (_dir) * _dist;
			_ypos = (_coords select 1) + cos (_dir) * _dist;
			_newPos = [_xpos,_ypos,0];		
			_aiGroup = [_newPos,3,4,"GREEN"] call blck_spawnGroup;
			blck_AIMajor2 = blck_AIMajor2 + _aiGroup;
			// spawn a static MG at the crate order the group to man it.
			[_newPos,_aiGroup,blck_staticWeapons call BIS_fnc_selectRandom] call blck_spawnEmplacedWeapon;
			diag_log "GREEN MISSION stationary weapon spawned";
		};
	};	
};
waitUntil{{isPlayer _x && _x distance _crate < 10 && vehicle _x == _x  } count playableunits > 0};
["The Sector at the Green Marker is under survivor control!"] call blck_MessagePlayers;
diag_log "[blckeagls] End of GREEN mission SM1";
MissionGoMajor2 = false;