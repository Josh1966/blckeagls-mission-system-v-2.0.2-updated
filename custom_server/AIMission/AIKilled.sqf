/*
	Based on code by blckeagls and Vampire
	Modified by Ghostrider
	Updated 1-26-15 
	Because this is precompiled there is less concern about keeping comments in.
	to do:
	1) figure out how to detect the case when AI is killed by being run over and penalize the player
	2) reward players who make legitimate kills
*/
private ["_unit","_killer","_startTime","_grpUnits"];
_unit = _this select 0;
_killer = _this select 1;

if (blck_AIAlertDistance > 0) then {
		{
			if (((position _x) distance (position _unit)) <= blck_AIAlertDistance) then {
				_x reveal [_killer, 1];
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

[_unit] joinSilent grpNull;

// unit cleanup moved here
_unit spawn {
	//diag_log "AI Cleanup script spawned";
	_this setOwner 1;
	sleep blck_aiCleanUpTimer;
	deleteVehicle _this;
};
