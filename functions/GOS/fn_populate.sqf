params["_loc"];

_m = createMarker [str _loc, locationPosition _loc];
_m setMarkerType "hd_dot";
_m setMarkerColor "ColorRed";
_loc setVariable ["marker", _m];

// Patrols
[_loc] spawn GOS_fnc_populatePatrols;
[_loc] spawn GOS_fnc_populateMilitaryHQ;
[_loc] spawn GOS_fnc_populateMilitaryTowers;
[_loc] spawn GOS_fnc_populateMilitaryWatchTowers;
[_loc] spawn GOS_fnc_populateSolarTowers;
[_loc] spawn GOS_fnc_populateSheds;