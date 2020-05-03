// Return positionAGL of the center of given grid sector

params["_grid"];

private _pos = (_grid call BIS_fnc_gridToPos) select 0;
_pos = [(_pos select 0) + 50, (_pos select 1) + 50, 0];

_pos