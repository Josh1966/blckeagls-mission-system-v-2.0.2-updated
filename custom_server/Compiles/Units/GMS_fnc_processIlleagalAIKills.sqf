/*
	by Ghostrider
	9-20-15
	Because this is precompiled there is less concern about keeping comments in.
*/

private["_missionType","_wasRunover","_launcher"];
params["_unit","_killer"];
//diag_log format["##-processIlleagalAIKills.sqf-## processing illeagal kills for unit %1",_unit];
_launcher = _unit getVariable ["Launcher",""];

 fn_targetVehicle = {  // force AI to fire on the vehicle with launchers if equiped
	private ["_vk","_unit","_handle"];
	_unit = _this select 0;
	_vk = _this select 1;

	{
		if (((position _x) distance (position _unit)) <= 350) then 
		{
			_x reveal [_vk, 4];
			_x dowatch _vk; 
			_x doTarget _vk; 
			if (_launcher != "") then 
			{	
				_x selectWeapon (secondaryWeapon _unit);
				_handle = _x fireAtTarget [_vk,_launcher];
			} else {
				_x doFire _vk;		
			};
		};
	} forEach allUnits;
};

fn_applyVehicleDamage = {  // apply a bit of damage 
	private["_vk","_vd"];
	_vk = _this select 0;
	_vd = getDammage _vk;
	_vk setDamage (_vd + blck_RunGearDamage);
};

fn_deleteAIGear = {
	private["_ai"];
	_ai = _this select 0;
	{deleteVehicle _x}forEach nearestObjects [(getPosATL _ai), ['GroundWeaponHolder','WeaponHolderSimulated','WeaponHolder'], 3];   //Adapted from the AI cleanup logic by KiloSwiss
	[_ai] call blck_fnc_removeGear;
};

if(typeOf _killer != typeOf (vehicle _killer)) then  // AI was killed by a vehicle
{
	if(_killer == driver(vehicle _killer))then{  // The AI was runover
		if(blck_RunGear) then { 
			[_unit] call fn_deleteAIGear;
			//diag_log format["<<--->> Unit %1 was run over by %2",_unit,_killer];
		};
		if (blck_VK_RunoverDamage) then {//apply vehicle damage
			[vehicle _killer] call fn_applyVehicleDamage;
			//diag_log format[">>---<< %1's vehicle had had damage applied",_killer];
		};
		[_unit, vehicle _killer] call fn_targetVehicle;
	};
};

if ( (typeOf vehicle _killer) in blck_forbidenVehicles or (currentWeapon _killer) in blck_forbidenVehicleGuns) then {
	//diag_log format["!!---!! Unit was killed by a forbidden vehicle or gun",_unit];
	if (blck_VK_Gear) then {[_unit] call fn_deleteAIGear;};
	[_unit, vehicle _killer] call fn_targetVehicle;
	if (blck_VK_GunnerDamage) then {
		[vehicle _killer] call fn_applyVehicleDamage;
	};   
	["IED","",0] call blck_fnc_messageplayers;
};
