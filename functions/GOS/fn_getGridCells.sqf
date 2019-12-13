/**
 * Function that returns all gridCells.
 * Several players can be on the same gridCell, but it is returned once nonetheless.
 */

_gridCells = [];

{
	_gridCell = mapGridPosition _x;
	_gridCells pushBackUnique _gridCell;
} forEach (allPlayers - entities "HeadlessClient_F");

_gridCells