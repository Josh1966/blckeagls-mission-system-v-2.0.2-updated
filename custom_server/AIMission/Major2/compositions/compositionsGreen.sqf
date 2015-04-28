/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_default","_resupplyCamp","_redCamp","_medicalCamp"];

_default = [
	[
		"A group of Bandits was sighted in a nearby sector! Check the Green marker on your map for the location!",
		"The Sector at the Green Marker is under survivor control!"
	],
	[

	]
];

_resupplyCamp = 
[
	[
		"A Bandit resupply camp has been spotted. Check the Green marker on your map for its location",
		"The Bandit resupply camp is under player control"
	],
	[
		["TK_WarfareBVehicleServicePoint_Base_EP1",[-5.41016,2.13477,0]], 
		//["I_MRAP_03_hmg_F",[13.2988,4.7168,0]], 
		["CamoNet_INDP_big_F",[14.251,2.91992,0]], 
		["Land_BagBunker_Small_F",[-20.4346,9.43164,0]], 
		["Land_BagBunker_Small_F",[-20.3604,-12.6035,0]], 
		["Land_BagBunker_Small_F",[28.4453,-11.791,0]], 
		["Land_BagBunker_Small_F",[28.3711,15.5703,0]]
	]
];

_redCamp =
[
	[
		"A Bandit Red camp has been spotted. Check the Green marker on your map for its location",
		"The Bandit Red camp is under player control"
	],
	[
		["Land_CampingChair_V1_F",[1.32227,2.07813,8.2016e-005]], 
		["Land_CampingChair_V1_F",[-2.01465,2.91992,3.05176e-005]], 
		["FirePlace_burning_F",[0.0302734,4.26563,2.47955e-005]], 
		["Land_CampingChair_V1_F",[2.47168,4.21484,0.000102997]], 
		["Land_CampingChair_V1_F",[-1.86816,5.07422,3.05176e-005]], 
		["Land_CampingChair_V1_F",[0.915039,6.20898,1.71661e-005]], 
		["Land_Sleeping_bag_brown_F",[8.27441,0.609375,0.00414658]], 
		["Land_Sleeping_bag_brown_F",[8.27344,2.76758,0.00447083]], 
		["Land_Sleeping_bag_brown_F",[7.9082,4.95898,-0.00173759]], 
		["Land_Garbage_square3_F",[-4.95508,8.24023,0.00018692]], 
		["Land_Camping_Light_F",[8.92773,3.80273,-0.000205994]], 
		["Land_Sleeping_bag_brown_F",[7.32129,7.55859,-0.0051899]], 
		["Land_TentDome_F",[-9.75488,3.13477,0.00125313]], 
		["Land_WoodPile_F",[-0.322266,9.97266,-0.000553131]], 
		["Land_Razorwire_F",[-0.0185547,-9.84961,0.0752335]], 
		["Land_CampingChair_V1_folded_F",[3.8584,9.59375,0]], 
		["Land_TentDome_F",[-8.76855,7.85156,-0.00471497]], 
		["Land_BagFence_Round_F",[8.99707,-8.01367,-0.00951576]], 
		["Land_BagFence_Round_F",[-10.8164,-6.33594,-0.0038681]], 
		["Land_TentDome_F",[-7.12207,11.8398,-0.00328445]], 
		["Land_CampingTable_small_F",[-4.62598,13.2754,7.62939e-005]], 
		["Land_Camping_Light_F",[-4.5957,13.332,0.687943]], 
		["Land_Razorwire_F",[15.5459,0.605469,0.145557]], 
		["Land_BagFence_Round_F",[7.16211,13.8516,0.000429153]], 
		["Land_Razorwire_F",[15.9678,8.35938,0.0635166]], 
		["Land_Razorwire_F",[-19.1553,-1.61328,-0.0238552]], 
		["Land_Razorwire_F",[-12.3906,-15.4492,0.0128002]], 
		["Land_Razorwire_F",[-19.4629,5.67969,0.0492821]], 
		["Land_BagFence_Round_F",[-11.2891,17.6777,-0.00759888]], 
		["Land_Razorwire_F",[15.2949,-14.3027,0.0502853]], 
		["Land_Razorwire_F",[15.2852,16.2656,-0.0208111]], 
		["Land_Razorwire_F",[4.80273,21.8223,-0.0563145]], 
		["Land_Razorwire_F",[-17.7891,13.4863,-0.0646877]], 
		["Land_Razorwire_F",[-14.7109,20.2871,0.0674477]], 
		["Land_BagFence_Round_F",[25.3975,-6.08008,0.00466537]], 
		["Land_Wreck_Truck_F",[26.6289,12.2441,0.00333214]], 
		["Land_GarbageBags_F",[-24.9463,17.3066,0.000968933]], 
		["Land_BagFence_Round_F",[11.167,28.832,-0.00405121]], 
		["Land_BagFence_Round_F",[-6.36914,30.6953,-0.000207901]], 
		["Land_Wreck_Hunter_F",[21.0391,25.9707,0.0118179]], 
		["Land_Camping_Light_F",[-33.7852,10.0371,0.000759125]], 
		["Land_BagFence_Round_F",[-34.3232,10.1035,0.00181007]]
	]
];

_medicalCamp = 
[
	[
		"A Bandit Meidcal camp has been spotted. Check the Green marker on your map for its location",
		"The Bandit Medical camp is under player control"
	],
	[
		["PowGen_Big",[0.698242,-2.4668,-0.00763702]], 
		//["B_Heli_Transport_01_F",[1.37012,13.498,0.00109863]], 
		["Land_BagBunker_Small_F",[18.4512,-3.66406,0.00780487]], 
		["US_WarfareBAntiAirRadar_Base_EP1",[-19.1367,11.7539,0]], 
		["Land_BagBunker_Small_F",[-22.707,-3.75586,-0.0130234]], 
		["TK_WarfareBFieldhHospital_Base_EP1",[24.3584,7.45313,0.00111389]], 
		["StorageBladder_01_fuel_forest_F",[1.29492,29.3184,0.000999451]], 
		["Land_GarbageBags_F",[-9.45996,31.252,0.02005]], 
		["Land_GarbageBags_F",[-13.0459,32.668,-0.0283051]], 
		["Land_GarbageBags_F",[-11.5957,33.125,-0.598007]], 
		["Land_GarbageBags_F",[-8.98145,34.5801,-0.00514221]], 
		["TK_GUE_WarfareBBarracks_Base_EP1",[24.8369,24.6582,-0.00820923]], 
		["Land_GarbageBags_F",[-10.9443,35.0449,0.577057]], 
		["Land_Cargo20_military_green_F",[14.6533,32.9004,0.000480652]], 
		["Land_BagBunker_Small_F",[-23.0186,28.6738,-0.0271301]], 
		["Land_BagBunker_Small_F",[37.1504,34.5742,0.0146866]]
	]
];

