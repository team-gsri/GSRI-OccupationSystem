[
    "GOS_renderDistance",
    "SLIDER",
    "Ennemy range generation (km)",
    "GOS settings",
    [1, 4, 2, 1], // data for this setting: [min, max, default, number of shown trailing decimals]
    true
] call CBA_fnc_addSetting;

prev = [0,0,0];
actives = [];

LISTE_EXCLUSION = [];

while{true} do {
	_coord = getPos player;
	{ _coord set [_forEachIndex, 1000 * floor (_x / 1000)] } forEach _coord;
	if!(_coord isEqualTo prev) then {
		prev = _coord;
		[prev] spawn GOS_fnc_search;
	};
	sleep 10;
};