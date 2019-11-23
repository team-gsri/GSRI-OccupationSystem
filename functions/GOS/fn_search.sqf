params["_pos"];

_distance = 100*round(GOS_renderDistance * 10);

// Retrait des trucs trop loin
_tmp = [];
{
	if(locationPosition _x distance2D player < _distance) then { _tmp pushBack _x }
	else { [nearestLocation [(locationPosition _x), "Invisible"] ] spawn GOS_fnc_clear };
} forEach actives;
actives = _tmp;

// Ajout des nouvelles localisations
_locs = nearestLocations[player, ["NameCityCapital", "NameCity", "NameVillage"], _distance];
{
	if!(_x in actives) then {
		actives pushBack _x;
		[createLocation ["Invisible", locationPosition _x, 1, 1]] spawn GOS_fnc_populate;
	};
} forEach _locs;