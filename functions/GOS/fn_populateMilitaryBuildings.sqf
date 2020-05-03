// Populate military prefabs like HQ and (watch)towers
// by [-GSRI-] Cheitan
params["_location"];
private _center = locationPosition _location;

// _units_list is the list of CREATED units in the process of populating
// _building_list is the list of USED buildings in the process of populating
// this way, another run on the same area will not duplicate ennemies
private _unitsList = [];
private _buildingList = _location getVariable ["GOS_marked", []];

// Accepted types of buildings and soldiers
private _detectedBuildings = (_center nearObjects ["Cargo_Patrol_base_F", 1000]) + (_center nearObjects ["Cargo_Tower_base_F", 1000]) + (_center nearObjects ["Cargo_HQ_base_F", 1000]);
private _paxTypes = ["O_Soldier_F", "O_Sharpshooter_F", "O_Soldier_SL_F", "O_Soldier_AR_F", "O_engineer_F", "O_medic_F"];

// Populating based on buildingPos
{
	private _building = _x;
	if!(_building getVariable ["marked", false]) then {
		_building setVariable ["marked", true];
		private _buildingPos = [_building] call BIS_fnc_buildingPositions;
		private _group = createGroup [east, true];
		{
			if(random 1 < 0.6) then {
				private _pax = _group createUnit [(selectRandom _paxTypes), _x, [], 0, "CAN_COLLIDE"];
				_pax setDir random 360;
				doStop _pax;
				_unitsList pushBack _pax;
			};
		} forEach _buildingPos;
		//[_group] call DW_fnc_addInjurableGroup;
		_buildingList pushBack _building;
	};
} forEach _detectedBuildings;

_location setVariable ["GOS_marked", _buildingList];
_location setVariable ["GOS_spawnedUnits", _unitsList];