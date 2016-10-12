
if (!isServer) exitWith{};
_modType = call blck_getModType;
if (_modType isEqualTo "Epoch") then
{
	[] execVM "\q\addons\custom_server\MapAddons\MapAddons_Epoch.sqf";
};

if (_modType isEqualTo "Exile") then
{
	[] execVM "\q\addons\custom_server\MapAddons\MapAddons_Exile.sqf";
};