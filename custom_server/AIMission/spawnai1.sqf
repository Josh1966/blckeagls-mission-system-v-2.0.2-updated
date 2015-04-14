//Sets Private Variables to they don't interfere when this script is called more than once
private["_pos","_weaponlist","_ammolist","_skinlist","_itemlist","_randomNumberWeapon","_randomNumberSkin","_randomNumberItem","_numbertospawn","_whichweap","_whichitem","_whichskin","_weapon","_ammo","_item","_skin","_i"];

//Gets variables passed form SM1.sqf
_pos = _this select 0;
_numai1 = _this select 1;
_numai2 = _this select 2;
_weaponList = _this select 3;
_spawnVehicle = _this select 4;

//Spawns correct ammount of AI
if (_numai2 > _numai1) then {
	_numbertospawn = floor( (random (_numai2 - _numai1) + _numai1 ) );
} else {
	_numbertospawn = _numai2;
};

//Creates a group to make them attack players
_aiGroup = createGroup RESISTANCE;	

//Counter variable
_i = 0;

//Spawns the correct number of AI Units
while {_i < _numbertospawn} do {
	_i = _i + 1;
	
	
	//Weapons Selects	
	_whichweap = _weaponList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this weapon array: %1",_whichweap];// For debug
	
	//assigns class name based on random number generated
	_weapon = _whichweap select 0;
	//diag_log format["AI Got this weapon: %1",_weapon];// For debug
	
	//This isnt reall needed anymore -- but it needs to have something passed
	_ammo = _whichweap select 1;
	//diag_log format["AI Got this weapon magazine: %1",_ammo];// For debug
	
	//Selects a random item from blck_AIItemList to add to the AI...
	_item = blck_AIItemList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this item: %1",_item];// For debug
	
	//Selects a random skin
	_skin = blck_SkinList call BIS_fnc_selectRandom;
	//diag_log format["AI Got this skin: %1",_skin];// For debug
	
	//Finds a safe positon to spawn the AI in the area given
	_safepos = [_pos,0,27,1,0,2000,0] call BIS_fnc_findSafePos;
	
	//Spawns the AI units
	[_safepos,_weapon,_ammo,_item,_skin,_aiGroup] execVM "\q\addons\custom_server\AIMission\AI1.sqf";
};


if (_spawnVehicle) then {
	//Finds  a safe postion to spawn the vehicles
	_safepos = [_pos,0,27,1,0,2000,0] call BIS_fnc_findSafePos;
	//Spawns the vehicles
	//[_safepos] execVM "\q\addons\custom_server\AIMission\spawnVehicle.sqf";
	[_safepos, _aiGroup] execVM "\q\addons\custom_server\AIMission\spawnVehicle.sqf";
};