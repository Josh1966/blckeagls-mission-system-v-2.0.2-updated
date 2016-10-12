/*
	AI Mission for Epoch Mod for Arma 3
	For the Mission System originally coded by blckeagls
	By Ghostrider
	Functions and global variables used by the mission system.
	Last modified 9/13/16
*/
//blck_variablesLoaded = false;
blck_debugON = fasle;  // When true the mission system writes additional debug information to the .RPT
blck_minFPS = 13;

//  Do not change these unless you know what you are doing.
//Minimum distance for between missions
MinDistanceFromMission = 1500;

blck_ActiveMissionCoords = [];
blck_recentMissionCoords = [];
//blck_emplacedWeapons = [];
blck_monitoredVehicles = [];
blck_liveMissionAI = [];
blck_missionObjects = [];

//west setFriend [resistance, 0];
//BLUFOR setFriend [resistance, 0];


// Arrays for use during cleanup of alive AI at some time after the end of a mission
DBD_HeliCrashSites = [];

// radius within whih missions are triggered. The trigger causes the crate and AI to spawn.
blck_TriggerDistance = 1000;

blck_deadAI = [];

blck_missionSpawning = false;

diag_log "[blckeagls] Variables Loaded";
blck_variablesLoaded = true;
