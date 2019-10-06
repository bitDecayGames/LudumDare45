/// @description genPerlinNoise1D(width,seed, octaves, bias);
/// @param width
/// @param seed
/// @param octaves
/// @param bias

var _width = argument0;
var _seed = argument1;
var _octaves = argument2;
var _bias = argument3 == 0 ? .1 : argument3;

var outputArr = array_create(_width);

for(var xVal = 0; xVal < _width; xVal++)
{
	var noise = 0.0;
	var scale = 1.0;
	var scaleAcc = 0.0;
	for(var o = 0; o < _octaves; o++)
	{
		var pitch = floor(_width >> o);
		var sample1 = floor(xVal / pitch) * pitch;
		var sample2 = (sample1 + pitch) mod _width;
		
		var blend = (xVal - sample1) / pitch;
		var sample = (1.0 - blend) * _seed[sample1] + blend * _seed[sample2]
		noise += sample * scale
		scaleAcc += scale;
		scale = scale / _bias; 
	}
	outputArr[xVal] = noise / scaleAcc;
}

return outputArr