params["_loc"];
_center = locationPosition _loc;
_hq_list = [];

{
	_group = createGroup [east, true];
	_units = ["O_Soldier_F", "O_Soldier_AR_F", "O_engineer_F", "O_Soldier_SL_F", "O_medic_F"];
	for "_i" from 0 to count(_x buildingPos -1) do
	{
		if(random 1 > 0.5) then {
			_u = _group createUnit [(selectRandom _units), (_x buildingPos _i), [], 0, "CAN_COLLIDE"];
			_hq_list pushBack _u;
		};
	};
	{ doStop _x } forEach units _group;
	//[_group] call DW_fnc_addInjurableGroup;
} forEach (_center nearObjects ["Cargo_HQ_base_F", 1000]);

_loc setVariable ["GOS_hq", _hq_list];