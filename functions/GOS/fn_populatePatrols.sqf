params["_loc"];
_center = locationPosition _loc;
_patrols_list = [];

// City patrols
for "_i" from 0 to 3 do
{
	_position = [(_center select 0) + random (200) - random (200) , (_center select 1) + random (200) - random (200) , 0];
	_group = [_position, east, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "UInfantry" >> "OIA_GuardSquad")] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	{ _patrols_list pushback _x } forEach (units _group);
	[_group, _center, 200] call BIS_fnc_taskPatrol;
};

_loc setVariable ["GOS_patrols", _patrols_list];