params["_shed"];

private _list = [];
private _veh = ["O_MRAP_02_hmg_F", "O_MRAP_02_F", "O_LSV_02_unarmed_F", "O_LSV_02_armed_F"];
private _pos = [[1.4,0,0],[1.4,7,0],[1.4,-7,0]];
{
	if(random 1 > 0) then {
		private _type = selectRandom _veh;
    	private _space = (_shed modelToWorld _x) isFlatEmpty [3, -1, -1, 1, -1, false, _shed];
		if(count _space > 0) then {
			private _v = createVehicle [_type, ASLToAGL _space, [], 0, "NONE"];
			_v setDir (getDir _shed)+90;
			//_v setPosASL _space;
			_v setDamage 0;
			_list pushBack _v;
		};
	};
} forEach _pos;
sleep 1;
createGuardedPoint [east, _shed, -1, objNull];
private _group = [getPosATL _shed, east, ["O_Soldier_F", "O_Soldier_AR_F", "O_crew_F"]] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
//[_group] call LM_fnc_addInjurableGroup;
{ _list pushback _x } forEach (units _group);
private _wp = _group addWaypoint [_shed, -1];
_wp setWaypointType "GUARD";
_wp setWaypointBehaviour "SAFE";

_list