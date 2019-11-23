params["_loc"];
_center = locationPosition _loc;
_solar_list = [];

{
	if(random 1 > 0.5) then {
		_u = (createGroup [east, true]) createUnit ["O_Sharpshooter_F", (_x modelToWorld [0,0,24]), [], 0, "CAN_COLLIDE"];
		//[_u] call LM_fnc_addInjurableUnit;
		_solar_list pushBack _u;
	};
} forEach (_center nearObjects ["Land_spp_Tower_F", 2000]);

_loc setVariable ["GOS_solar", _solar_list];