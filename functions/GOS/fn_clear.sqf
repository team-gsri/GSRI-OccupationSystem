params["_stronghold"];

{
	{
		// TODO delete unmanaged vehicles
		if(vehicle player == _x) then { EXCLUSION_LIST pushBack _x }
		else { deleteVehicle _x };
	} forEach _x;
} forEach [
	_stronghold getVariable ["GOS_patrols",[]],
	_stronghold getVariable ["GOS_hq",[]],
	_stronghold getVariable ["GOS_solar",[]],
	_stronghold getVariable ["GOS_sheds",[]],
	_stronghold getVariable ["GOS_towers",[]],
	_stronghold getVariable ["GOS_watch",[]]
];

{ _x setVariable ["marked", nil] } forEach (_stronghold getVariable ["GOS_marked",[]]);
deleteMarker str _stronghold;
_stronghold setVariable ["GOS_occupied", false];