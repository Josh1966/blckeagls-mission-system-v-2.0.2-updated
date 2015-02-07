//Debug information 
diag_log format["SpawnVehicles _this: %1",_this];

//Gets position information from spawnai1.sqf
_pos = _this select 0;

//Creates a group for Vehicles
//_aiGroup = createGroup RESISTANCE;	
_aiGroup = _this select 1;
_aiGroup setcombatmode "RED";
_aiGroup allowfleeing 0;
_aiGroup setspeedmode "FULL";
_ai = ObjNull;

//Finds a safe positon in area to spawn
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;

//Spawns 1 AI Unit
"O_G_Soldier_SL_F" createUnit [_safepos, _aiGroup, "_ai = this", 0.1, "PRIVATE"];
removeBackpackGlobal _ai;
removeAllItemsWithMagazines  _ai;
_ai setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai setVariable["LAST_CHECK",1000000000000];
_ai enableAI "TARGET";
_ai enableAI "AUTOTARGET";
_ai enableAI "MOVE";
_ai enableAI "ANIM";
_ai enableAI "FSM";
_ai allowDammage true;
_ai setCombatMode "RED";
_ai setBehaviour "COMBAT";
_ai setVariable ["AI",true,true];


//Spawns 1 AI Unit
_ai1 = ObjNull;
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
"O_G_Soldier_SL_F" createUnit [_safepos, _aiGroup, "_ai1 = this", 0.1, "PRIVATE"];
removeBackpackGlobal _ai1;
removeAllItemsWithMagazines  _ai1;
_ai1 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai1 setVariable["LAST_CHECK",1000000000000];
_ai1 enableAI "TARGET";
_ai1 enableAI "AUTOTARGET";
_ai1 enableAI "MOVE";
_ai1 enableAI "ANIM";
_ai1 enableAI "FSM";
_ai1 allowDammage true;
_ai1 setCombatMode "RED";
_ai1 setBehaviour "COMBAT";
_ai1 setVariable ["AI",true,true];


//Spawns 1 AI Unit
_ai2 = ObjNull;
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
"O_G_Soldier_SL_F" createUnit [_safepos, _aiGroup, "_ai2 = this", 0.1, "PRIVATE"];
removeBackpackGlobal _ai2;
removeAllItemsWithMagazines  _ai2;
_ai2 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai2 setVariable["LAST_CHECK",1000000000000];
_ai2 enableAI "TARGET";
_ai2 enableAI "AUTOTARGET";
_ai2 enableAI "MOVE";
_ai2 enableAI "ANIM";
_ai2 enableAI "FSM";
_ai2 allowDammage true;
_ai2 setCombatMode "RED";
_ai2 setBehaviour "COMBAT";
_ai2 setVariable ["AI",true,true];


//Spawns 1 AI Unit
_ai3 = ObjNull;
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
"O_G_Soldier_SL_F" createUnit [_safepos, _aiGroup, "_ai3 = this", 0.1, "PRIVATE"];
removeBackpackGlobal _ai3;
removeAllItemsWithMagazines  _ai3;
_ai3 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai3 setVariable["LAST_CHECK",1000000000000];
_ai3 enableAI "TARGET";
_ai3 enableAI "AUTOTARGET";
_ai3 enableAI "MOVE";
_ai3 enableAI "ANIM";
_ai3 enableAI "FSM";
_ai3 allowDammage true;
_ai3 setCombatMode "RED";
_ai3 setBehaviour "COMBAT";
_ai3 setVariable ["AI",true,true];

//Spawns 1 AI Unit
_ai4 = ObjNull;
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
"O_G_Soldier_SL_F" createUnit [_safepos, _aiGroup, "_ai4 = this", 0.1, "PRIVATE"];
removeBackpackGlobal _ai4;
removeAllItemsWithMagazines  _ai4;
_ai4 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai4 setVariable["LAST_CHECK",1000000000000];
_ai4 enableAI "TARGET";
_ai4 enableAI "AUTOTARGET";
_ai4 enableAI "MOVE";
_ai4 enableAI "ANIM";
_ai4 enableAI "FSM";
_ai4 allowDammage true;
_ai4 setCombatMode "RED";
_ai4 setBehaviour "COMBAT";
_ai4 setVariable ["AI",true,true];


//Spawns 1 AI Unit
_ai5 = ObjNull;
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
"O_G_Soldier_SL_F" createUnit [_safepos, _aiGroup, "_ai5 = this", 0.1, "PRIVATE"];
removeBackpackGlobal _ai5;
removeAllItemsWithMagazines  _ai5;
_ai5 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai5 setVariable["LAST_CHECK",1000000000000];
_ai5 enableAI "TARGET";
_ai5 enableAI "AUTOTARGET";
_ai5 enableAI "MOVE";
_ai5 enableAI "ANIM";
_ai5 enableAI "FSM";
_ai5 allowDammage true;
_ai5 setCombatMode "RED";
_ai5 setBehaviour "COMBAT";
_ai5 setVariable ["AI",true,true];


//Spawns a AI Vehicle
_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
_veh = ObjNull;
_veh = createVehicle["B_G_Offroad_01_armed_F", _safepos, [], 0, "NONE"];
_veh setVariable["LASTLOGOUT_EPOCH",1000000000000];
_veh setVariable["LAST_CHECK",1000000000000];
//Moves 2 AI units into vehicle
_ai moveInAny _veh;
_ai1 moveInAny _veh;
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
clearItemCargoGlobal       _veh;


_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
_veh = ObjNull;
_veh = createVehicle["B_G_Offroad_01_armed_F", _safepos, [], 0, "NONE"];
_veh setVariable["LASTLOGOUT_EPOCH",1000000000000];
_veh setVariable["LAST_CHECK",1000000000000];
_ai2 moveInAny _veh;
_ai3 moveInAny _veh;
EPOCH_VehicleSlotsLimit = EPOCH_VehicleSlotsLimit + 1;
EPOCH_VehicleSlots pushBack str(EPOCH_VehicleSlotsLimit);
_slot = EPOCH_VehicleSlots select 0;
_veh setVariable ['VEHICLE_SLOT',_slot,true];
EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];
EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable 'EPOCH_VehicleSlotCount';
_veh call EPOCH_server_setVToken;
clearWeaponCargoGlobal    _veh;
clearMagazineCargoGlobal  _veh;
clearBackpackCargoGlobal  _veh;
clearItemCargoGlobal       _veh;

_safepos = [_pos,0,27,0,0,20,0] call BIS_fnc_findSafePos;
_veh = ObjNull;
_veh = createVehicle["B_G_Offroad_01_armed_F", _safepos, [], 0, "NONE"];
_veh setVariable["LASTLOGOUT_EPOCH",1000000000000];
_veh setVariable["LAST_CHECK",1000000000000];
_ai4 moveInAny _veh;
_ai5 moveInAny _veh;
EPOCH_VehicleSlotsLimit = EPOCH_VehicleSlotsLimit + 1;
EPOCH_VehicleSlots pushBack str(EPOCH_VehicleSlotsLimit);
_slot = EPOCH_VehicleSlots select 0;
_veh setVariable ['VEHICLE_SLOT',_slot,true];
EPOCH_VehicleSlots = EPOCH_VehicleSlots - [_slot];
EPOCH_VehicleSlotCount = count EPOCH_VehicleSlots;
publicVariable 'EPOCH_VehicleSlotCount';
_veh call EPOCH_server_setVToken;
clearWeaponCargoGlobal    _veh;
clearMagazineCargoGlobal  _veh;
clearBackpackCargoGlobal  _veh;
clearItemCargoGlobal       _veh;