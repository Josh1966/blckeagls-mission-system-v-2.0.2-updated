	// Delete objects in a list after a certain time.
	// code to delete any smoking or on fire objects adabted from kalania http://forums.bistudio.com/showthread.php?165184-Delete-Fire-Effect/page1
	
	private ["_buildings","_done","_startTime","_units","_wokka"];
	
	_buildings = _this select 0;
	_waitTime = _this select 1;

	_startTime = diag_tickTime;
	waitUntil {sleep 10; (diag_tickTime - _startTime) > _waitTime;};

	{
		_wokka = _x;
		//diag_log format["cleanupObjects.sqf object is typeOf %1", typeOf _x];
		{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach (_wokka nearObjects 5);   deleteVehicle _wokka;  
		//diag_log format["[cleanupObjects.sqf] Deleting object %1", _x];
	} forEach _buildings;
	


 



