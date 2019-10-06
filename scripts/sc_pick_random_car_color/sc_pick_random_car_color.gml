var possibleValues = [0.1, 0.3, 0.7, 0.8, 0.9, 1.0];

var color1 = [sc_choose_from_array(possibleValues), sc_choose_from_array(possibleValues), sc_choose_from_array(possibleValues)];
var color2 = [sc_choose_from_array(possibleValues), sc_choose_from_array(possibleValues), sc_choose_from_array(possibleValues)];
var color3 = [sc_choose_from_array(possibleValues), sc_choose_from_array(possibleValues), sc_choose_from_array(possibleValues)];

return [
	color1[0],
	color1[1],
	color1[2],
	color2[0],
	color2[1],
	color2[2],
	color3[0],
	color3[1],
	color3[2]
];