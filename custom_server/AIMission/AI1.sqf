/*
	Code by blckeagls
	Modified by Ghostrider
	Code to delete dead AI bodies moved to AIKilled.sqf
	Now being run as a precompiled function.
*/

//Defines private variables so they don't interfere with other scripts
private ["_pos","_i","_weap","_ammo","_other","_skin","_aiGroup","_ai1","_magazines","_players","_owner","_ownerOnline","_nearEntities","_skill"];

//Gets variables passed from spawnai.sqf/spawnai1.sqf
_pos = _this select 0;  // Position at which to spawn AI
_weap = _this select 1;  // Weapon to give AI
_ammo = _this select 2;  // Ammo to give AI
_other = _this select 3;  // Other stuff to give AI
_skin = _this select 4;  // Skin to give AI
_aiGroup = _this select 5;  // Group to which AI belongs
_skill = _this select 6;  // Array of skills for the AI -  not used - can delete ?

//Creating the AI Unit
_ai1 = ObjNull;
//Creates the AI unit from the _skin passed to it
"i_g_soldier_unarmed_f" createUnit [_pos, _aiGroup, "_ai1 = this", 0.7, "COLONEL"];
//Cleans the AI to a fresh spawn
removeBackpackGlobal _ai1;
removeAllItemsWithMagazines  _ai1;
//_ai1 AddUniform _skin;
_ai1 forceAddUniform _skin;

//Stops the AI from being cleaned up
_ai1 setVariable["LASTLOGOUT_EPOCH",1000000000000];
_ai1 setVariable["LAST_CHECK",1000000000000];

//Sets AI Skills
_ai1 enableAI "TARGET";
_ai1 enableAI "AUTOTARGET";
_ai1 enableAI "MOVE";
_ai1 enableAI "ANIM";
_ai1 enableAI "FSM";
_ai1 allowDammage true;
_ai1 setBehaviour "COMBAT";
_ai1 setunitpos "AUTO";
_ai1 setVariable ["Engaged", 0, true];

sleep 1; //For some reason without this sometimes they don't spawn the weapon on them

//Adds 5 magazines to AI Unit
_ai1 addMagazine [_ammo,5];
_i = 0;
while {_i < 4} do {
	_i = _i + 1;
	_ai1 addItem _ammo;
};

//Adds the weapon specified to it from spawnai.sqf/spawnai1.sqf
_ai1 addWeaponGlobal  _weap; 
//diag_log format["AI1.sqf - AI %2 to recieve this weapon: %1",_weap,_ai1]; // For debug
sleep 1; //For some reason without this sometimes they don't spawn the weapon on them
//_currentweapon = currentMuzzle _ai1;// For debug

//adds items to AI.  _other = ["ITEM","COUNT"]
_i = 0;
while {_i < (_other select 1)} do {
	_i = _i + 1;
	_ai1 addItem (_other select 0)
};

//Sets a variable that this is an AI... Can be used for other scipts to determine if its an AI unit
_ai1 setVariable ["AI",true,true];

//EDIT - NARINES
//Gives the AI unlimited Ammo
//Not sure how "economic" this is ressource wise but it runs only once every 30 secs so it can't be that bad. 
[_ai1, _ammo] spawn {
	private ["_unitAmmo", "_unit","_mags"];	
	_unit = _this select 0;
	_unitAmmo = _this select 1;
	_addCount = 0;
	
	//As long as unit is alive
	while {alive _unit} do {
		
		//Get array of all magazines unit has
		_mags = magazines _unit;
		
		//If needed ammo type is not in _mags array
		if(!(_unitAmmo in _mags)) then {
			//Add needed ammo twice. 
			_unit addMagazine _unitAmmo;
			_unit addMagazine _unitAmmo;
		};
		sleep 30;
	};
};

// Do something if AI is killed
_ai1 addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] spawn blck_AIKilled; }];
