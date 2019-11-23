params["_loc"];
_center = locationPosition _loc;
_sheds_list = [];

// Half shed
{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_sheds_list append ([_x] call GOS_fnc_popHalfShed);
	};
} forEach (_center nearObjects ["Land_Shed_Small_F", 1000]);

// Big shed
{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_sheds_list append ([_x] call GOS_fnc_popFullShed);
	};
} forEach (_center nearObjects ["Land_Shed_Big_F", 1000]);

// Metal shed
{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_sheds_list append ([_x] call GOS_fnc_popMetalShed);
	};
} forEach (_center nearObjects ["Land_i_Shed_Ind_F", 1000]);

_loc setVariable ["GOS_sheds", _sheds_list];