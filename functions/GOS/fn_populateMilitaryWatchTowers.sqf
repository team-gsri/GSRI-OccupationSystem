params["_loc"];
_center = locationPosition _loc;
_list = [];

{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_group = createGroup [east, true];
		_units = ["O_Soldier_F", "O_Sharpshooter_F", "O_Soldier_SL_F"];
		_u = _group createUnit [(selectRandom _units), (_x buildingPos 1), [], 0, "CAN_COLLIDE"];
		_u setDir random 360;
		_list pushBack _u;
		{doStop _x} forEach units _group;
		//[_group] call DW_fnc_addInjurableGroup;
	};
} forEach (_center nearObjects ["Cargo_Patrol_base_F", 1000]);

_loc setVariable ["GOS_watch", _list];