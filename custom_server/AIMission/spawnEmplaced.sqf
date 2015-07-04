// Spawns a vehicle or emplaced weapons, man's it, and destroys it when the AI gets out.

private["_pos","_emplaced","_aiGroup","_safepos","_ai","_ai1","_slot","_veh","_i"];

_pos = _this select 0;
_aiGroup = _this select 1;
_emplaced = _this select 2;

if (!(_emplaced in blck_staticWeapons)) exitWith {diag_log "spawnEmplaced -- >> Not a valid static weapon";};

_safepos = [_pos,30,45,0,0,20,0] call BIS_fnc_findSafePos;
_veh = createVehicle[_emplaced, _safepos, [], 0, "NONE"];
_veh setVariable["LAST_CHECK",1000000000000];
// This should fix the issue with players dismantling static weapons and running off with a 50 cal.
_veh addEventHandler ["GetOut",{(_this select 0) setDamage 1;}];
_veh call EPOCH_server_setVToken;
clearWeaponCargoGlobal    _veh;
clearMagazineCargoGlobal  _veh;
clearBackpackCargoGlobal  _veh;
clearItemCargoGlobal      _veh;
_gunner = _aiGroup select 0;
_gunner moveingunner _veh;
_veh setVehicleLock "LOCKEDPLAYER";
//[_veh] spawn blck_vehicleMonitor;
	
_veh;