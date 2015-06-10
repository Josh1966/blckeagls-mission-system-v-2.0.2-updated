/*
Mission Compositions by Bill prepared for DBD Clan
*/
private ["_default","_resupplyCamp","_redCamp","_medicalCamp"];

_default = [
	[
		"A group of Bandits was sighted in a nearby sector! Check the Orange marker on your map for the location!",
		"The Sector at the Orange Marker is under survivor control!"
	],
	[

	]
];

_resupplyCamp = 
[
	[
		"A Bandit resupply camp has been spotted. Check the Orange marker on your map for its location",
		"The Bandit resupply camp is under player control"
	],
	[
		["Land_Cargo_Patrol_V1_F",[-29.41016,0.13477,-0.0224228],359.992,1,0,[],"","",true,false], 

		["CamoNet_INDP_big_F",[18.3711,15.5703,-0.00395203],54.9965,1,0,[],"","",true,false]
	]
];

_redCamp =
[
	[
		"A Bandit camp has been spotted. Check the Orange marker on your map for its location",
		"The Bandit camp is under player control"
	],
	[
		["Land_CampingChair_V1_F",[1.32227,2.07813,8.2016e-005],108.293,1,0], 

		["Land_BagFence_Round_F",[-34.3232,10.1035,0.00181007],60.0012,1,0]
	]

];


_medicalCamp = 
[
	[
		"A Bandit Medical camp has been spotted. Check the Orange marker on your map for its location",
		"The Bandit Medical camp is under player control"
	],
	[
		["Land_dp_transformer_F",[1.698242,-10.4668,-0.00763702],271.32,1,0,[],"","",true,false], 
 
		["Land_BagBunker_Small_F",[37.1504,34.5742,0.0146866],255,1,0,[],"","",true,false]
	]
];

