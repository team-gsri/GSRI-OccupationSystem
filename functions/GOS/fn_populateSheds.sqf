params["_loc"];
private _center = locationPosition _loc;
private _sheds_list = [];
private _building_list = _loc getVariable ["GOS_marked", []];

// Half shed
{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_sheds_list append ([_x] call GOS_fnc_popHalfShed);
		_building_list pushBack _x;
	};
} forEach (_center nearObjects ["Land_Shed_Small_F", 1000]);

// Big shed
{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_sheds_list append ([_x] call GOS_fnc_popFullShed);
		_building_list pushBack _x;
	};
} forEach (_center nearObjects ["Land_Shed_Big_F", 1000]);

// Metal shed
{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_sheds_list append ([_x] call GOS_fnc_popMetalShed);
		_building_list pushBack _x;
	};
} forEach (_center nearObjects ["Land_i_Shed_Ind_F", 1000]);

_loc setVariable ["GOS_marked", _building_list];
_loc setVariable ["GOS_sheds", _sheds_list];