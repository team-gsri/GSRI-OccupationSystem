params["_stronghold"];

_stronghold setVariable ["GOS_occupied", true];
private _distance = 100*round(GOS_renderDistance * 10);

private _marker = createMarker [str _stronghold, locationPosition _stronghold];
_marker setMarkerType "hd_dot";
_marker setMarkerColor "ColorRed";
_stronghold setVariable ["marker", _marker];

// Patrols
[_stronghold] call GOS_fnc_populatePatrols;
[_stronghold] call GOS_fnc_populateMilitaryBuildings;
[_stronghold] call GOS_fnc_populateSolarTowers;
[_stronghold] call GOS_fnc_populateSheds;