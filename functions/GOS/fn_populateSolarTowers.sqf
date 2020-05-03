// Solar towers are ideal sniper positions
// by [-GSRI-] Cheitan
params["_location"];
private _center = locationPosition _location;

// _units_list is the list of CREATED units in the process of populating
// _building_list is the list of USED buildings in the process of populating
// this way, another run on the same area will not duplicate ennemies
private _unitsList = [];
private _buildingList = _location getVariable ["GOS_marked", []];

{
	if!(_x getVariable ["marked", false]) then {
		_x setVariable ["marked", true];
		_buildingList pushBack _x;
		if(_forEachIndex == 0 || random 1 > 0.5) then {
			private _pax = (createGroup [east, true]) createUnit ["O_Sharpshooter_F", (_x modelToWorld [0,0,24]), [], 0, "CAN_COLLIDE"];
			//[_pax] call LM_fnc_addInjurableUnit;
			_unitsList pushBack _pax;
		};
	};
} forEach (_center nearObjects ["Land_spp_Tower_F", 2000]);

_location setVariable ["GOS_marked", _buildingList];
_location setVariable ["GOS_spawnedUnits", _unitsList];