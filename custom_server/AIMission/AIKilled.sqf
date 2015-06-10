/*
	Based on code by blckeagls and Vampire
	Modified by Ghostrider
	Updated 1-26-15 
	Because this is precompiled there is less concern about keeping comments in.
	to do:
	1) figure out how to detect the case when AI is killed by being run over and penalize the player
	2) reward players who make legitimate kills
*/
private ["_unit","_killer","_startTime","_grpUnits","_alertDist","_intelligence","_weapons","_killersVehicle","_handle","_launcher","_runover","_unitMission"];
_unit = _this select 0;
_killer = _this select 1;
_launcher = secondaryWeapon _unit;
_alertDist = _unit getVariable ["alertDist",300];
_intelligence = _unit getVariable ["intelligence",1];

if (_alertDist > 0) then {
		{
			if (((position _x) distance (position _unit)) <= _alertDist) then {
				_x reveal [_killer, _intelligence];
				//diag_log "Killer revealed";
			}
		} forEach allUnits;
};
if ((count (units group _unit)) > 1) then {
	if ((leader group _unit) == _unit) then {
		_grpUnits = units group _unit;
		_grpUnits = _grpUnits - [_unit];
		(group _unit) selectLeader (_grpUnits call BIS_fnc_selectRandom);
	};
};

if (blck_launcherCleanup) then 
{
	if (_launcher != "") then 
	{
		_launcherRounds = getArray (configFile >> "CfgWeapons" >> _Launcher >> "magazines") select 0;
		_unit removeWeapon _Launcher;
		removeVest _unit;
		{
			if(_x == _launcherRounds) then {
				_unit removeMagazine _x;
			};
		} count magazines _unit;
			
	};
};

if (blck_useNVG) then
{
	if (_unit getVariable ["hasNVG",false]) then
	{
		_unit unassignitem "NVG_EPOCH"; _unit removeweapon "NVG_EPOCH";
	};
};
//diag_log format["[AIKilled.sqf] --- >>> unit %1 killed",_unit];
[_unit] joinSilent grpNull;
// use the epoch cleanup routines to delete the ai corpse
_unit setVariable ["LAST_CHECK", (diag_tickTime + blck_bodyCleanUpTimer)];


_missionType = _unit getVariable ["Mission","none"];
switch (_missionType) do
{
	case "blue": {blck_AIMinor = blck_AIMinor - [_unit];};
	case "red": {blck_AIMinor2 = blck_AIMinor2 - [_unit];};
	case "green": {blck_AIMajor2 = blck_AIMajor2 - [_unit];};
	case "orange": {blck_AIMajor = blck_AIMajor - [_unit];};
	default {};
};

//diag_log format["isPlayer killer is %1", isPlayer _killer];
// Handle case where one AI kills another or AI die from falling or explosions unrelated to player activity
if (!(isPlayer _killer)) exitWith {};

// handle situations where the AI was killed by being run over or by a gun on a vehicle's gun
 // These functions assist with handling vehicle kills
 fn_targetVehicle = {  // force AI to fire on the vehicle with launchers if equiped
	private ["_vk","_unit"];
	_unit = _this select 0;
	_vk = _this select 1;

	{
		if (((position _x) distance (position _unit)) <= 350) then 
		{
			_x reveal [_vk, 4];
			//diag_log "Killers vehicle revealed";
			_x dowatch _vk; 
			_x doTarget _vk; 
			if (_launcher != "") then 
			{	
				//diag_log "launcher selected";
				_x selectWeapon (secondaryWeapon _unit);
				_handle = _x fireAtTarget [_vk,_launcher];
				//diag_log format["AIKilled.sqf] result of fireAtTarget is %1",_handle];
			} else {
				_x doFire _vk;		
			};
		};
	} forEach allUnits;
};

fn_applyVehicleDamage = {  // apply a bit of damage 
	private["_vk"];
	_vk = _this select 0;
	_d = getDammage _vk;
	_vk setDamage (_d + blck_RunGearDamage);
	getDammage _vk;
	//diag_log format["[AIKilled.sqf] vehicle damage applied, damage now %1", getDammage _vk];
};

fn_deleteAIGear = {
	private["_ai"];
	_ai = _this select 0;
	{deleteVehicle _x}forEach nearestObjects [(getPosATL _ai), ['GroundWeaponHolder','WeaponHolderSimulated','WeaponHolder'], 3];   //Adapted from the AI cleanup logic by KiloSwiss
	[_ai] call blck_removeGear;
};

//diag_log format["[AIKilled.sqf] --->>> AI was killed by a %1 which is a kind of %2",_killer,typeOf _killer];
//diag_log format["[AIKilled.sqf] --- >>> killer's vehicle was %1 which is a kind of %2",vehicle _killer, typeOf (vehicle _killer)];

if(typeOf _killer != typeOf (vehicle _killer)) then  // AI was killed by a vehicle
{
	//diag_log "[AIKilled.sqf] AI was killed by a vehicle in some way <<<<<<<<<-------------->>>>>>>>>>>>";
	if(_killer == driver(vehicle _killer))then{  // The AI was runover
		//diag_log "[AIKilled.sqf] AI was run over";
		if(blck_RunGear) then { 
			[_unit] call fn_deleteAIGear;
		};
		if (blck_VK_RunoverDamage) then {//apply vehicle damage
			[vehicle _killer] call fn_applyVehicleDamage;
		};
		[_unit, vehicle _killer] call fn_targetVehicle;
	};
};

if ((typeOf _killer != "Epoch_Male_F")) then {
	//diag_log "[AIKilled] --- >>> evaluating case where killer is player and not Epoch_Male_F";
	//diag_log format["AIKilled -->> vehicle gunner = %1", gunner(vehicle(_killer))];	
	//diag_log "[AIKilled.sqf] ---- >>>> AI was killed by an gun on a vehicle.";
	// Assume that this is the case for the script logic for now
	if (blck_VG_Gear) then {[_unit] call fn_deleteAIGear;
	[_unit, vehicle _killer] call fn_targetVehicle;
	if(typeOf(vehicle _killer) in blck_forbidenVehicles)then{ // the player was not permitted to kill AI with that vehicle typeOf blck_forbidenVehicles
		//diag_log "[AIKilled.sqf] Vehicle is in forbiddentlist !!!";
		if (blck_VK_GunnerDamage) then {
			[vehicle _killer] call fn_applyVehicleDamage;
		};
	};   
};
// unit cleanup moved here
/*
_unit spawn {
	//_this setOwner 1;
	sleep blck_aiCleanUpTimer;
	deleteVehicle _this;
};
*/