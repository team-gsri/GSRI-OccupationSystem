params["_loc"];

deleteMarker (_loc getVariable "marker");

_clear_list = {
	params["_list"];
	{ deleteVehicle _x } forEach _list;
};

{
	[_x] spawn _clear_list;
} forEach [
	_loc getVariable ["GOS_patrols",[]],
	_loc getVariable ["GOS_hq",[]],
	_loc getVariable ["GOS_solar",[]],
	_loc getVariable ["GOS_sheds",[]]
];