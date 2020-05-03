params["_shed"];

private _list = [];
private _veh = ["O_Truck_02_transport_F", "O_Truck_02_medical_F", "O_Truck_02_covered_F", "O_APC_Wheeled_02_rcws_v2_F"];
private _pos = [[0,0,0],[0,8,0],[0,-8,0]];
{
	if(random 1 > 0.5) then {
		private _type = selectRandom _veh;
		//_space = [(_shed modelToWorld _x) select 0, (_shed modelToWorld _x) select 1, 0] findEmptyPosition [0,3,_type];
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
createGuardedPoint [east, _shed, -1, objNull];

sleep 1;
// Gardiens
private _position = [(getPos _x select 0) + random (200) - random (200) , (getPos _x select 1) + random (200) - random (200) , 0];
private _group = [getPos _shed, east, ["O_Soldier_F", "O_Soldier_F", "O_Soldier_F"]] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
//[_group] call LM_fnc_addInjurableGroup;
{ _list pushback _x } forEach (units _group);
private _wp = _group addWaypoint [_shed, -1];
_wp setWaypointType "GUARD";
_wp setWaypointBehaviour "SAFE";

_list