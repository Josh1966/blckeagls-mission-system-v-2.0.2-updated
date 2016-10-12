
_modType = call blck_getModType;

if (_modType isEqualTo "Epoch") then
{
	[] execVM "\q\addons\custom_server\SLS\SLS_init_epoch.sqf";
};

if (_modType isEqualTo "Exile") then
{
	[] execVM "q\addons\custom_server\SLS\SLS_init_exile.sqf";
};