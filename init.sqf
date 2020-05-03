/**
 * Commonly used terms :
 *	- gridCell		: 100x100m zone where players can be found, in mapGridPosition format.
 *	- stronghold	: dynamic spawn point linked to a native town/village.
 *		GOS_occupied = false : stronghold exists but is too far away from players to spawn AIs.
 *		GOS_occupied = true  : stronghold near gridCells, with active AIs spread over a certain distance.
 */

// Settings
[
    "GOS_renderDistance",
    "SLIDER",
    "Ennemy range generation (km)",
    "GOS settings",
    [1, 4, 2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true
] call CBA_fnc_addSetting;

// Strongholds prepositionning
private _cities = (configFile >> "CfgWorlds" >> worldName >> "Names");
private _strongholds = [];
{
	if (getText (_cities >> _x >> "type") in ["NameCity", "NameCityCapital", "NameVillage"]) then {
		private _stronghold = createLocation["Invisible", getArray (_cities >> _x >> "position"), 1, 1];
		_stronghold setVariable ["GOS_occupied", false];
		_strongholds pushBack _stronghold;
	};
} forEach (_cities call BIS_fnc_getCfgSubClasses);
// TODO : custom strongholds ?

sleep 5;

EXCLUSION_LIST = [];

while{true} do {
	// Retrieve active gridCells
	private _gridCells = call GOS_fnc_getGridCells;

	// Check for strongholds deactivation
	{
		private _stronghold = _x;
		private _closeToGridCell = _gridCells apply { (locationPosition _stronghold distance2D (_x call GOS_fnc_gridToPos)) < 1000 };
		if!(true in _closeToGridCell) then { [_stronghold] call GOS_fnc_clear }; //todo
	} forEach (_strongholds select {_x getVariable "GOS_occupied"});

	// Check for new strongholds activation
	{
		private _gridCellPos = [_x] call GOS_fnc_gridToPos;
		private _renderDistance = 100*round(GOS_renderDistance * 10);
		private _candidates = nearestLocations[_gridCellPos, ["Invisible"], _renderDistance] select {!(_x getVariable "GOS_occupied")};
		{ [_x] call GOS_fnc_populate } forEach _candidates;
	} forEach _gridCells;

	sleep 10;
};