/*
	Map Addon Loaderspawnsspawns content from mapaddon files exported from the editor.
	Developed for DBD Clan
	By Ghostrider-DBD-
	Copyright 2016
*/
if (!isServer) exitWith{};
private["_startTime"];
_startTime = diag_tickTime;

diag_log "Starting Custom Map Addons for blckeagls Epoch";
_world = toLower format ["%1", worldName];
blck_addons_path = "\q\addons\custom_server\MapAddons\";
blck_addons_list = [];

switch (_world) do {
	
	case "altis": {
		blck_addons_path = "\q\addons\custom_server\MapAddons\mapcontent\Altis\";
		blck_addons_list = [
							"trader_ATMs.sqf"
							];
		diag_log "Custom Map Addons for Altis as of 6/11/16 added";
	};
	default{
		// tanoaatmmil
		diag_log "MAP ADDONS:: ->> Loading Map Addons for default";
		blck_addons_list = [];
		blck_addons_path = "";
	};
};
diag_log format["MapAddons:: addons list is %1",blck_addons_list];
{
	diag_log format["MapAddons: loading addon %1",blck_addons_path + _x];
	_handle = execVM (blck_addons_path + _x);
} forEach blck_addons_list;

blck_addons_path = nil;
blck_addons_list = nil;
blck_mapAddonsComplete = true;
diag_log format["Map Addons for blckeagls mission system loaded in %1 seconds",(diag_tickTime - _startTime)]