// Spawns mines in a region centered around a specific position.

private ["_mines"];
_mines = _this select 0;
//diag_log format["deleting %1 mines----- >>>> ", count _mines];
{
	deleteVehicle _x;
} forEach _mines;

