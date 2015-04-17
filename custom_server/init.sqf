/*
AI Mission Compiled by blckeagls @ Zombieville.net
Code was modified by blckeagls using other peoples code.  Been over a year, don't have their names anymore.  
Modified by Ghostrider: Using code or ideas from others including Vampire, Narines, KiloSwiss, blckeagls, theFUCHS, lazylink, Mark311
*/

sleep 10; // wait for other systems to load before initializing

diag_log "[blckeagls] loading version 04-15-15 build 2.2...... >>";
// Load Configuration information
//call compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIconfigs.sqf";
call compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIconfigs.sqf";

// Get information about the map
sleep 5;
[] execVM "\q\addons\custom_server\AIMission\findWorld.sqf";
sleep 5;
// compile functions
call compile preprocessFileLineNumbers "\q\addons\custom_server\AIMission\AIfunctions.sqf";

// Load any user-defined specifications or overrides
execVM "\q\addons\custom_server\AIMission\configOverrides.sqf";

//Start the mission timers
[] execVM "\q\addons\custom_server\AIMission\Major\majorTimer.sqf"; //Starts major mission system
[] execVM "\q\addons\custom_server\AIMission\Major2\major2Timer.sqf";//Starts major mission system 2
[] execVM "\q\addons\custom_server\AIMission\Minor\minorTimer.sqf";//Starts minor mission system
[] execVM "\q\addons\custom_server\AIMission\Minor2\minor2Timer.sqf";//Starts minor mission system 2

diag_log "[blckeagls] >>--- Completed initialization"; 
sleep 30;
{"blckeagles Mission system has been started"] call blck_MessagePlayers;