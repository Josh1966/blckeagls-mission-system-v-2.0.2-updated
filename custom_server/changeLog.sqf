/*
blck Mission system by Ghostrider-DBD-
Loosely based on the AI mission system by blckeagls ver 2.0.2
Contributions by Narines: bug fixes, testing, 'fired' event handler
Ideas or code from that by it07, Vampire and KiloSwiss have been used for certain functions.

9-19-16 Ver 5.1.2/11/16
Minor bug fixes to support Exile.
-Corrected errors with scout and hunter missions trying to spawn using Epoch headgear.
-Corrected error wherein AI were spawned as Epoch soldiers
-Inactivated a call to an exile function that had no value 

9-15-16 vER 6.1.1
1) Reverted to the old spawnUnits routine because the new one was not spawning AI at Hunters correctly.

9-13-16 Ver 6.10
1) Added waypoints for spawned AI Vehicles.
2) Reworked the logic for generating the positions of these waypoints
3) Added loiter waypoints in addition to move wayponts.
4) Reworked the param/params for spawnUnits
5) several other minor optimizations.

9-3-16 Ver 6.0
1) Re-did the custom_server folder so the mod automatically starts. Blck_client.sqf no longer calls the mod from the server.
2) Added a variable blck_modType which presently can be either "Epoch" or "Exile" with the aim of having a single mission system for both mods.
3) Added a more intelligent method for loading key components (variables, functions, and map-specific parameters).
4) Re-did all code to automatically select correct parameters to run correctly on either exile or epoch servers.
5) Added the Exile Static Loot Crate Spawner; Re-did this to load either an exile or epoch version as needed since a lot of the variables and also the locations tables are unique.
6) FEATURE DISABLED
7) Pulled the map addons function from the Exile build and added a functionality to spawn addons appropriately for map and mod type.
8) FEATURE DISABLED
9) FEATURE DISABLED
10) Added settings to enable / disable specific mission classes, e.g., blck_enableOrangeMissions. Set to 1 to enable, -1 to disable.

8-14-16
Added mission timout feature, set blck_missionTimout = -1 to disble;
Changed to use of params for all .sqf which also eliminated calls to BIS_fnc_params
changed to selectRandom for all .sqf

Added the armed powerler to the list of default mission vehicles.

2/28/16
1) Bug fixes completed. Cleanup of bodies is now properly separated from cleanup of live AI. Cleanup of vehicles with live AI is now working correctly.
3) Next step will be to add in the heli reinforcements for ver 5.2 (still in the works).

2/20/16
Bugfixes and enhancements.
1) added checks for nearby bases or nearby players when spawning missions.
2) Fixed typos in Medical Camp missions.
3) Added two new modes for completing mission: 1) mission is complete when all AI are killed; 2) mission is complete when player reaches the crate OR when all AI are killed.

In Progress
1) Mission timouts
2) Added optional reinforcments via helicopters which can then patrol the mission area.

2/11/16
Major Update to Build 5.0

2) The mission timer now calles a file containing the mission parameters. The mission spawner is included and run from that file.
3) A kill feed was added reporting each AI kill.
4) AI kills are now handled via an event handler run on the server for forward compatability with headless clients.
5) Multiple minor errors and bug fixes related to mission difficulty, AI loadouts, loot and other parameters were included. 
6) The first phase of restructuring of the file structure has been completed. Most code for functions and units has been moved to a compiles directory in Compiles\Units and Compiles\Functions.
7) Some directionality and randomness was added where mission objects are spawned at random locations from an array of objects to give the missions more of a feeling of a perimeter defense where H-barrier and other objects were added.
8) As part of the restructuing, variables were moved from AIFunctions to a separate file.
9) Bugs in routines for cleanup of dead and live AI were fixed. A much simpler system for tracking live AI, dead AI, locations of active and recent missions, was implemented because of the centralization of the mission spawning to a single script