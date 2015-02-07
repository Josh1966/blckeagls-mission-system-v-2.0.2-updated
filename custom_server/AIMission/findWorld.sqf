/*
	Determine the map name, set the map center and size, and return the map name.
	Trader coordinates were pulled from the config.cfg
*/
private["_blck_WorldName"];
// Lets get the map name for mission location purposes
_blck_WorldName = toLower format ["%1", worldName];
switch (_blck_WorldName) do {// These may need some adjustment - including a test for shore or water should help as well to avoid missions spawning on water.
	case "altis":{
		blck_mapCenter = [6322,7801,0]; 
		blck_mapRange = 12000; 
		if (blck_blacklistSpawns) then {
			blck_locationBlackList = blck_locationBlackList + [[[14939,15083,0],1000],[[23600, 18000,0],1000],[[23600,18000,0],1000]];
		};
		diag_log "[blckeagls]: Worldname is Altis. Map Specific Settings Defined";		
	}; // Add Central, East and West respawns/traders 
	case "stratis":{
		blck_mapCenter = [6322,7801,0]; 
		blck_mapRange = 4500; 
		if (blck_blacklistSpawns) then {
			blck_locationBlackList = blck_locationBlackList + [[[4031,4222,0],1000],[[1719,5120,0],1000],[[1719,5121,0],1000]];
		};
		diag_log "[blckeagls]: Worldname is Stratis. Map Specific Settings Defined";	
	}; // Add Central, East and West respawns/traders 
	case "chernarus":{
		blck_mapCenter = [7100, 7750, 0]; //centerPosition = {7100, 7750, 300};
		blck_mapRange = 6000;
		if (blck_blacklistSpawns) then {
			blck_locationBlackList = blck_locationBlackList + [[[4569.52, 4524.24, 0.201431],800],[[12077.8, 5121.92, 0.00144958],800],[[10688.6, 9428.98, 0.00144958],800]];
		};
		diag_log "[blckeagls]: Worldname is Chernarus. Map Specific Settings Defined";	
	}; // 
	default {
			_blck_WorldName = "default";  // provide the defaults for "altis"			
			blck_mapCenter = [6322,7801,0]; 
			blck_mapRange = 12000;
			diag_log format["[blckeagls]: Unknown map name %1. Default World Settings Used",_blck_WorldName];	
	};
};

blck_WorldName = _blck_WorldName;
