	
// Place any overrides of the default configurations here.
// An example would be to move the center or change the dimensions for the map on which the missions are spawned so that only part of the map is used.
// Or map-specific configurations if you run the mission system on multiple servers.


diag_log "[blckeagls] Loading Configuration Overides";
//diag_log format["[configOverides.sqf] blck_WorldName is %1",blck_WorldName];

if (blck_debugON) then 
{
	diag_log "[blckeagls] Debug seting is ON, Custom configurations used";
	//Minimum Spawn time between missions in seconds
		blck_TMin_Major = 5; // Orange
		blck_TMin_Major2 = 4; // Green
		blck_TMin_Minor = 2;  // Blue
		blck_TMin_Minor2 = 3; // Red
	
	//Maximum Spawn time between missions in seconds
		blck_TMax_Major = 10;
		blck_TMax_Major2 = 8;
		blck_TMax_Minor = 4;
		blck_TMax_Minor2 = 6;
		
		blck_aiCleanUpTimer = 30; // in seconds
		
		blck_SpawnVeh_Major = 1; //3;
		blck_SpawnVeh_Major2 = 1; //2;
		blck_SpawnVeh_Minor = 1;
		blck_SpawnVeh_Minor2 = 1; //1;
};



