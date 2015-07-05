//Debug information 

private["_pos","_noVehPatrols","_level","_vehType","_minDis","_maxDis","_dir","_arc","_xpos","_ypos","_newpos","_vehType","_safepos","_units","_dist","_aiGroup","_numAI","_veh","_theUnit"];

//Gets position information from spawnai1.sqf
_pos = _this select 0;
_noVehPatrols = [_this,1,1] call BIS_fnc_param;
_minDis = [_this,2,30] call BIS_fnc_param;
_maxDis = [_this,3,45] call BIS_fnc_param;
_level = [_this,4,"red"] call BIS_fnc_param;
_numAI = [_this,5,3] call BIS_fnc_param;

_units = [];
_dir = round(random(360));
_arc = 360/_noVehPatrols;

for "_i" from 1 to _noVehPatrols do
{	
	// spread out the spawn points for the vehicles
	_dir = _dir + _arc;
	_dist = round(_minDis + (random(_maxDis - _minDis)));
	_xpos = (_pos select 0) + sin (_dir) * _dist;
	_ypos = (_pos select 1) + cos (_dir) * _dist;
	_newpos = [_xpos,_ypos,0];	

	
	// Spawn the vehicle
	_vehType = [blck_AI_Vehicles] call BIS_fnc_selectRandom;
	//diag_log format["spawnVehicle.sqf: _vehType is %1",_vehType];
	_safepos = [_newpos,0,25,0,0,20,0] call BIS_fnc_findSafePos;	
	_veh = createVehicle["I_G_Offroad_01_armed_F", _safepos, [], 0, "NONE"];
	_veh setVariable["LAST_CHECK",14400];
	_veh addEventHandler ["GetOut",{}];
	_veh addEventHandler ["GetIn",{  // forces player to be ejected if he/she tries to enter the vehicle
		private ["_theUnit"];
		_theUnit = _this select 2;
		_theUnit action ["Eject", vehicle _theUnit];
	}];
	//_veh addEventHandler ["Hit", {[(_this select 0), (_this select 1)] call blck_EH_vehicleHit;}];
	_veh call EPOCH_server_setVToken;
	_veh setVehicleLock "LOCKEDPLAYER";

	// Spawn AI to man the vehicle
	_aiGroup = [_safepos,_numAI,_numAI,_level,_pos,_minDis,_maxDis] call blck_spawnGroup;	
	_units = _units + _aiGroup;
	//diag_log format["spawnVehicle.sqf: _aiGroup is %1", _aiGroup];

	//Moves 3 AI units into vehicle
	(_aiGroup select 0) moveingunner _veh;
	(_aiGroup select 1) moveindriver _veh;
	for "i" from 2 to (count _aiGroup) do {
		(_aiGroup select _i) moveInCargo _veh;
	};
	_veh lockCargo true;
	_veh setVariable ["Driver", driver _veh,true];
	_veh setVariable ["Gunner", gunner _veh, true];
	_veh setVariable ["Cargo", (_aiGroup select 2), true];
	_veh setVariable ["Group", group (driver _veh), true];
	
	//diag_log format["spawnVehicle.sqf: vehicle crew is %1", (crew _veh)];	
	//Clears vehicle inventory
	clearWeaponCargoGlobal    _veh;
	clearMagazineCargoGlobal  _veh;
	clearBackpackCargoGlobal  _veh;
	clearItemCargoGlobal       _veh;
	_veh setVehicleLock "LOCKEDPLAYER";
	[_veh] spawn blck_vehicleMonitor;
};

_units;