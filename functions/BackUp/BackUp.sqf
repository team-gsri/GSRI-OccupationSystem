/*environment type detection
Checking order is on sea then in city then on hills
*/

_loc = getTerrainHeightASL position player;
if (_loc <= 0) then {
	hint "c'est dans l'eau.";
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