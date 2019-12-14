params["_stronghold"];

_stronghold setVariable ["GOS_occupied", true];
_distance = 100*round(GOS_renderDistance * 10);

_m = createMarker [str _stronghold, locationPosition _stronghold];
_m setMarkerType "hd_dot";
_m setMarkerColor "ColorRed";
_stronghold setVariable ["marker", _m];

// Patrols
[_stronghold] call GOS_fnc_populatePatrols;
[_stronghold] call GOS_fnc_populateMilitaryHQ;
[_stronghold] call GOS_fnc_populateMilitaryTowers;
[_stronghold] call GOS_fnc_populateMilitaryWatchTowers;
[_stronghold] call GOS_fnc_populateSolarTowers;
[_stronghold] call GOS_fnc_populateSheds;