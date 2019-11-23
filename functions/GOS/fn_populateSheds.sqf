params["_loc"];
_center = locationPosition _loc;
_sheds_list = [];

// Half shed
_veh = ["O_MRAP_02_hmg_F", "O_MRAP_02_F", "O_LSV_02_unarmed_F", "O_LSV_02_armed_F"];
{
	_shed = _x;
	_pos = [[1.4,0,0],[1.4,7,0],[1.4,-7,0]];
	{
		if(random 1 > 0.5) then {
			_type = selectRandom _veh;
			_space = [(_shed modelToWorld _x) select 0, (_shed modelToWorld _x) select 1, 0] findEmptyPosition [0,3,_type];
			if(count _space > 0) then {
				_v = createVehicle [_type, [0,0,1000], [], 0, "NONE"];
				_v setDir (getDir _shed)+90;
				_v setPosATL _space;
				_v setDamage 0;
				_sheds_list pushBack _v;
			};
		};
	} forEach _pos;
	createGuardedPoint [east, _shed, -1, objNull];
	_group = [getPos _x, east, ["O_Soldier_F", "O_Soldier_AR_F", "O_crew_F"]] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	//[_group] call LM_fnc_addInjurableGroup;
	{ _sheds_list pushback _x } forEach (units _group);
	_wp = _group addWaypoint [_shed, -1];
	_wp setWaypointType "GUARD";
	_wp setWaypointBehaviour "SAFE";
} forEach (_center nearObjects ["Land_Shed_Small_F", 1000]);

// Big shed
_veh = ["O_Truck_02_transport_F", "O_Truck_02_medical_F", "O_Truck_02_covered_F", "O_APC_Wheeled_02_rcws_v2_F"];
{
	_shed = _x;
	_pos = [[0,0,0],[0,8,0],[0,-8,0]];
	{
		if(random 1 > 0.5) then {
			_type = selectRandom _veh;
			_space = [(_shed modelToWorld _x) select 0, (_shed modelToWorld _x) select 1, 0] findEmptyPosition [0,3,_type];
				if(count _space > 0) then {
				_v = createVehicle [_type, [0,0,1000], [], 0, "NONE"];
				_v setDir (getDir _shed)+90;
				_v setPosATL _space;
				_v setDamage 0;
				_sheds_list pushBack _v;
			};
		};
	} forEach _pos;
	createGuardedPoint [east, _shed, -1, objNull];
	
	// Gardiens
	_position = [(getPos _x select 0) + random (200) - random (200) , (getPos _x select 1) + random (200) - random (200) , 0];
	_group = [getPos _x, east, ["O_Soldier_F", "O_Soldier_F", "O_Soldier_F"]] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	//[_group] call LM_fnc_addInjurableGroup;
	{ _sheds_list pushback _x } forEach (units _group);
	_wp = _group addWaypoint [_shed, -1];
	_wp setWaypointType "GUARD";
	_wp setWaypointBehaviour "SAFE";
} forEach (_center nearObjects ["Land_Shed_Big_F", 1000]);

// Metal shed
{
	_vehList = ["O_LSV_02_armed_F", "O_LSV_02_unarmed_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Quadbike_01_F"];
	_posList = [[13.5,4,-1.5], [0,6,-1.5], [-1,1,-1.5], [2,1,-1.5], [5,1,-1.5]];
	_dirList = [180, 270, 315, 315, 315];
	_shed = _x;
	{
		if(random 1 > 0.5) then {
			_space = (_shed modelToWorld (_posList select _forEachIndex)) findEmptyPosition [0,3,_x];
			if(count _space > 0) then {
				_v = createVehicle [_x, [0,0,1000], [], 0, "NONE"];
				_v setDir (getDir _shed)+(_dirList select _forEachIndex);
				_v setPos _space;
				_v setDamage 0;
				_sheds_list pushBack _v;
			};
		};
	} forEach _vehList;
	createGuardedPoint [east, _shed, -1, objNull];
	_group = [getPos _x, east, ["O_Soldier_F", "O_Soldier_F"]] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	//[_group] call LM_fnc_addInjurableGroup;
	{ _sheds_list pushback _x } forEach (units _group);
	_wp = _group addWaypoint [_shed, -1];
	_wp setWaypointType "GUARD";
	_wp setWaypointBehaviour "SAFE";
} forEach (_center nearObjects ["Land_i_Shed_Ind_F", 1000]);

_loc setVariable ["GOS_sheds", _sheds_list];