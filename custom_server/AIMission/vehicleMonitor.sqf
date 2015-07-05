private ["_veh","_unit","_units","_count","_group","_driver","_gunner","_cargo"];
_veh = _this select 0;

_count = 0;

waitUntil { count crew _veh > 0};
//diag_log "vehicle Manned";
while { (getDammage _veh < 1.0)} do 
{		//diag_log format["vehicleMonitor: vehicle crew consists of %1", crew _veh];
		//diag_log format["vehicleMonitor: number of crew alive is %1", {alive  _x} count crew _veh];
		_veh setVehicleAmmo 1;
		_veh setFuel 1;
		sleep 10;
		if ({alive  _x} count crew _veh < 1) then { _veh setDamage 1.1;};
		if (!alive gunner _veh) then { 
			{
				if (_x != driver _veh) exitWith {_x moveingunner _veh;};
			} forEach crew _veh;
		};
		if (!alive gunner _veh) then {driver _veh moveingunner _veh;};
		if (!alive driver _veh) then {
			{
				if (_x != gunner _veh) exitWith { _x moveindriver _veh;};
			} forEach crew _veh;
		};
		//diag_log format["vehicleMonitor.sqf: driver is %1; gunner is %2", driver _veh, gunner _veh];
};
//diag_log format["vehiclemonitor.sqf all crew for vehicle %1 are dead",_veh];
_veh setDamage 1;

_veh setVariable ["LAST_CHECK", (diag_tickTime + 60)];

