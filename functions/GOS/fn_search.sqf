params["_stronghold"];

_stronghold setVariable ["GOS_occupied", true];

_distance = 100*round(GOS_renderDistance * 10);

[_stronghold] spawn GOS_fnc_populate;