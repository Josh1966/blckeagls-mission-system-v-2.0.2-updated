// Spawns a vehicle or emplaced weapons, man's it, then destroys it when all its AI are dead

private["_pos","_emplaced","_aiGroup","_safepos","_ai","_ai1","_slot","_veh","_i"];

_pos = _this select 0;
_aiGroup = _this select 1;
_emplaced = _this select 2;

if (!(_emplaced in blck_staticWeapons)) exitWith {diag_log "spawnEmplaced -- >> Not a valid static weapon";};

//diag_log format["spawnEmplaced.sqf -- >> emplaced = %1",_emplaced];


//Finds a safe positon in area to spawn
	_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;

//Spawns a AI Vehicle
		_veh = createVehicle[_emplaced, _safepos, [], 0, "NONE"];
		_veh setVariable["LASTLOGOUT_EPOCH",1000000000000];
		_veh setVariable["LAST_CHECK",1000000000000];
		//So Vehicle doesnt despawn
		EPOCH_VehicleSlotsLimit = EPOCH_VehicleSlotsLimit + 1;
		EPOCH_VehicleSlots pushBack str(EPOCH_VehicleSlotsLimit);
		_slot = EPOCH_VehicleSlots select 0;
		_veh setVariable ['VEHICLE_SLOT',_slot,true];
		EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];
		EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
		publicVariable 'EPOCH_VehicleSlotCount';
		_veh call EPOCH_server_setVToken;
		//Creates vehicle inventory
		clearWeaponCargoGlobal    _veh;
		clearMagazineCargoGlobal  _veh;
		clearBackpackCargoGlobal  _veh;
		clearItemCargoGlobal      _veh;
		//_veh addEventHandler ["Fired",{[_this select 0,getNumber (configFile/"CfgAmmo"/(_this select 4)/"explosive")] spawn {if (_this select 1==1) then {sleep 12};_this select 0 setVehicleAmmo 0.5}}]
		
// For Ai to move into vehicle
		_gunner = _aiGroup select 0;
		_gunner moveingunner _veh;
		//diag_log "spawnEmplaced.sqf --- >>> gun manned";
		// add this weapon to the que for the vehicle monitor
		[_veh] spawn blck_vehicleMonitor;
		//diag_log "spawnEmplaced.sqf --- >>> vehicle monitor spawned";		
_veh;