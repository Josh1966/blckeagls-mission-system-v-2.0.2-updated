// Spawns a vehicle or emplaced weapons, man's it, and destroys it when the AI gets out.
// Not used retained for future uses

private["_pos","_emplaced","_aiGroup","_safepos","_ai","_ai1","_slot","_veh","_i"];

_pos = _this select 0;
_aiGroup = _this select 1;
_emplaced = _this select 2;

if (!(_emplaced in blck_staticWeapons)) exitWith {diag_log "spawnEmplaced -- >> Not a valid static weapon";};
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
_veh = createVehicle[_emplaced, _safepos, [], 0, "NONE"];
_veh setVariable["LAST_CHECK",14400];
_veh addEventHandler ["GetOut",{(_this select 0) setDamage 1;}];
_veh call EPOCH_server_setVToken;
clearWeaponCargoGlobal    _veh;
clearMagazineCargoGlobal  _veh;
clearBackpackCargoGlobal  _veh;
clearItemCargoGlobal      _veh;
//_veh addEventHandler ["Fired",{[_this select 0,getNumber (configFile/"CfgAmmo"/(_this select 4)/"explosive")] spawn {if (_this select 1==1) then {sleep 12};_this select 0 setVehicleAmmo 0.5}}]
		
// For Ai to move into vehicle
_gunner = _aiGroup select 0;
_gunner moveingunner _veh;
// ?? Is vehicle monitor needed now ?
//[_veh] spawn blck_vehicleMonitor;
//diag_log "spawnEmplaced.sqf --- >>> vehicle monitor spawned";		
_veh;