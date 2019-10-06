/// @param baseCost
/// @param ratePerLevel
/// @param currentStatValue
/// @param maxStatValue 

var baseCost = argument0;
var ratePerLevel = argument1;
var currentStatValue = argument2;
var maxStatValue = argument3;

var statRatio = currentStatValue / maxStatValue;
var costLevel = 0;
for (var i = 0; i < totalPills; ++i) {
	var ratio = (i + 1) / totalPills;
	if (ratio > statRatio) {
		// do nothing
	} else {
		costLevel = i + 1;
	}
}

return costLevel * ratePerLevel + baseCost;