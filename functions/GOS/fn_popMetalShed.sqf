params["_shed"];

private _list = [];
private _vehList = ["O_LSV_02_armed_F", "O_LSV_02_unarmed_F", "O_Quadbike_01_F", "O_Quadbike_01_F", "O_Quadbike_01_F"];
private _posList = [[13.5,4,-1.5], [0,6,-1.5], [-1,1,-1.5], [2,1,-1.5], [5,1,-1.5]];
private _dirList = [180, 270, 315, 315, 315];
{
	if(random 1 > 0.2) then {
    	private _space = (_shed modelToWorld (_posList select _forEachIndex)) isFlatEmpty [3, -1, -1, 1, -1, false, _shed];
		if(count _space > 0) then {
			private _v = createVehicle [_x, ASLToAGL _space, [], 0, "NONE"];
			_v setDir (getDir _shed)+(_dirList select _forEachIndex);
			//_v setPosASL _space;
			_v setDamage 0;
			_list pushBack _v;
		};
	};
} forEach _vehList;
sleep 1;
createGuardedPoint [east, _shed, -1, objNull];
private _group = [getPos _shed, east, ["O_Soldier_F", "O_Soldier_F"]] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
//[_group] call LM_fnc_addInjurableGroup;
{ _list pushback _x } forEach (units _group);
private _wp = _group addWaypoint [_shed, -1];
_wp setWaypointType "GUARD";
_wp setWaypointBehaviour "SAFE";

_list