/*
	Deal with the various processes of:
	removing the AI from the list of active AI
	Allerting nearby units
	Penalizing for illeagal Kills
	Rewarding for legal kills

	By Ghostrider-DBD-
	Copyright 2016
*/


params["_unit","_killer"];

//diag_log format["#-  processAIKill.sqf  -# called for unit %1",_unit];
//diag_log format["processAIKill:: calling rewardKiller for unit %1",_unit];
[_unit,_killer] call blck_fnc_rewardKiller;
//diag_log format["processAIKill:: rewardAIKiller routing called for unit %1",_unit];

_unit setVariable ["GMS_DiedAt", (diag_tickTime),true];

//[getPos _unit] spawn blck_protectObj;
blck_deadAI pushback _unit;
_group = group _unit;
[_unit] joinSilent grpNull;
if (count(units _group) < 1) then {deleteGroup _group;};
[_unit] spawn blck_fnc_removeLaunchers;
[_unit] spawn blck_fnc_removeNVG;
if !(isPlayer _killer) exitWith {};
[_unit,_killer] call blck_fnc_alertNearbyUnits;
[_unit,_killer] call blck_fnc_processIlleagalAIKills;

_weapon = currentWeapon _killer;
_message = format["[blck] %1: AI killed with %2 from %3 meters",name _killer,getText(configFile >> "CfgWeapons" >> _weapon >> "DisplayName"), round(_unit distance _killer)];
//diag_log format["[blck] unit killed message is %1",_message,""];
["aikilled",_message,"victory"] call blck_fnc_messageplayers;
{
	_unit removeAllEventHandlers  _x;
}forEach ["Killed","Fired","HandleDamage","HandleHeal","FiredNear"]

