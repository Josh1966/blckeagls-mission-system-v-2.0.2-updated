// Add this at the top of your Init.sqf
execVM "start_blck.sqf";
if (isServer) then {
	[] ExecVM "\q\addons\custom_server\init.sqf";
};