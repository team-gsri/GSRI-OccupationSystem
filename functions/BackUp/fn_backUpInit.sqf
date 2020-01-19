//Environment type detection near player
//TODO get player position from GOS

_loc = getTerrainHeightASL position player;
if (_loc <= 10) then {
	hint "c'est dans l'eau.";
	execVM "fn_atSea.sqf";
}
else {
	_loc = nearestLocations [position player, ["NameCityCapital", "NameCity", "NameVillage"], 400];
	_nb = count _loc;
	if (_nb !=0) then {
		hint "C'est en ville.";
	}
	else {
		if (getTerrainHeightASL position player > 170) then {
			hint "c'est en montagne.";
		}
		else {
			hint "C'est en terrain ouvert.";
		}
	}
};