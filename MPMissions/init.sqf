// Load the client
// Place the line below at the top of your init.sqf
execVM "blckClient.sqf";

//start the mission system.
// place the section below above any line that reads:
// if (isServer) exitWith {};
if (isServer) then {
	execVM "\q\addons\custom_server\init.sqf";
};
