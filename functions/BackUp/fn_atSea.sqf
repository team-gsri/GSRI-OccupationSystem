//This script will be executed if backup is needed near water

_option1 = {
	_vhl = createVehicle ["O_Boat_Armed_01_hmg_F", [0,0,0], [], 0, "NONE"];
	_grp = createVehicleCrew _vhl;
	_wp = _grp addWaypoint [position player, 300];
	_wp setWaypointType "UNLOAD";

	_grp1 = createGroup [east, true];
	_unitArray = [
		"O_Soldier_SL_F", "O_HeavyGunner_F", "O_Soldier_M_F", "O_Soldier_LAT_F", "O_Soldier_AR_F", "O_Soldier_AAR_F", "O_Sharpshooter_F", "O_medic_F"
	];

	{
		_unit = _grp1 createUnit [_x, [0,0,0], [], 0, "NONE"];
		_unit moveInAny _vhl;
		
	} forEach _unitArray;
};

_option2 = {
	_vhl = createVehicle ["O_Heli_Light_02_dynamicLoadout_F", [0,0,0], [], 0, "FLY"];
	_grp = createVehicleCrew _vhl;
	_wp = _grp addWaypoint [position player, 500];
	_wp setWaypointType "UNLOAD";
	_grp1 = createGroup [east, true];
	_unitArray = [
		"O_Soldier_SL_F", "O_HeavyGunner_F", "O_Soldier_M_F", "O_Soldier_LAT_F", "O_Soldier_AR_F", "O_Soldier_AAR_F", "O_Sharpshooter_F", "O_medic_F"
	];

	{
		_unit = _grp1 createUnit [_x, [0,0,0], [], 0, "NONE"];
		_unit moveInAny _vhl;
		
	} forEach _unitArray;
};

_nb = random 2;
hint str _nb;
if (_nb < 1) then { call _option1} else {call _option2};