if (isServer) then {
	[] ExecVM "\q\addons\custom_server\init.sqf";
};
"blck_Message" addPublicVariableEventHandler {/*titleText[format["%1",_this select 1],"PLAIN DOWN",1];*/systemChat format["%1",_this select 1]};
"blck_vehDamage" addPublicVariableEventHandler { // Based on code by KiloSwiss
	private ["_vehiclekiller","_vehiclePlayer","_status"];
	_vehiclekiller = _this select 1;
	_vehiclePlayer = vehicle player;
	if(!local _vehiclekiller)exitWith{};
	if(_vehiclekiller != _vehiclePlayer)exitWith{};
	_status = [	"MOTOR","karoserie","palivo","glass1","glass2","glass3","door1","door2","door3","door4",
	"wheel_1_1_steering","wheel_2_1_steering","wheel_1_2_steering","wheel_2_2_steering",
	"wheel_1_3_steering","wheel_2_3_steering","wheel_1_4_steering","wheel_2_4_steering"];
	{_vehiclekiller setHit [_x,(_vehiclekiller getHit _x)+(.2+(random .15))]}count _status;
};
[] execVM "debug\addmarkers.sqf";
[] execVM "debug\addmarkers2.sqf";
[] execVM "debug\addmarkers75.sqf";
[] execVM "debug\addmarkers752.sqf";