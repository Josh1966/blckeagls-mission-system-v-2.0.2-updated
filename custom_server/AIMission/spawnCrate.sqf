// for a future use

private ["_coords","_crate","_px","_py","_crateType"];

_coords = _this select 0;
_px = _coords select 0;
_py = _coords select 1;

_crateType = blck_crateTypes call BIS_fnc_selectRandom;
_crate = objNull;
_crate = createVehicle [_crateType,_coords,[], 0, "CAN_COLLIDE"];
_crate setVariable ["LAST_CHECK", (diag_tickTime + 14400)];
_crate setPosATL [_px, _py, 0.5];

_crate;
