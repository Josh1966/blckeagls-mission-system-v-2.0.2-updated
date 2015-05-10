// for a future use

private ["_coords","_crate","_posATL","_px","_py","_pz"];

_coords = _this select 0;
_px = _coords select 0;
_py = _coords select 1;

//Creates the crate
_crate = objNull;
_crate = createVehicle ["Box_NATO_Wps_F",_coords,[], 0, "CAN_COLLIDE"];
_crate setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_crate setPosATL [_px, _py, 0.5];

diag_log format["spawnCrate.sqf Crate Created at coords %1, returning object", _coords];

_crate;
