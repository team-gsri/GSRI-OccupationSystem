params["_loc"];
_center = locationPosition _loc;
_list = [];

{
	_group = createGroup [east, true];
	_u = _group createUnit ["O_Sharpshooter_F", (_x buildingPos 17), [], 0, "NONE"];
	_list pushBack _u;
	_units = ["O_Soldier_SL_F", "O_Soldier_F", "O_Soldier_AR_F", "O_engineer_F"];
	for "_i" from 0 to 16 do {
		if(random 1 > 0.6) then {
			_u = _group createUnit [(selectRandom _units), (_x buildingPos _i), [], 0, "NONE"];
			_list pushBack _u;
		};
	};
	{ doStop _x } forEach units _group;
	//[_group] call DW_fnc_addInjurableGroup;
} forEach (_center nearObjects ["Cargo_Tower_base_F", 1000]);

_loc setVariable ["GOS_towers", _list];