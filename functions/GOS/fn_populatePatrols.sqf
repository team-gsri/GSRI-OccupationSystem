// Add patrols around cities
// by [-GSRI-] Cheitan
params["_location"];
private _center = locationPosition _location;

// _units_list is the list of CREATED units in the process of populating
private _unitsList = [];

// City patrols TODO : spawning wayyyyyy too much guys, wtf ?
for "_i" from 0 to 3 do
{
	private _position = [(_center select 0) + random (200), (_center select 1) + random (200), 0];
	private _group = [_position, east, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "UInfantry" >> "OIA_GuardTeam")] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{ _unitsList pushback _x } forEach (units _group);
	[_group, _center, 200] call BIS_fnc_taskPatrol;
};

_location setVariable ["GOS_spawnedUnits", _unitsList];