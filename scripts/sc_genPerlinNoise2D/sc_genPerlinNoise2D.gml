/// @description genPerlinNoise2D(width,height,seed, octaves, bias);
/// @param width
/// @param height
/// @param seed
/// @param octaves
/// @param bias

var _width = argument0;
var _height = argument1;
var _seed = argument2;
var _octaves = argument3;
var _bias = argument4 == 0 ? .1 : argument4;

var outputArr = array_create(_width * _height);

for(var xVal = 0; xVal < _width; xVal++) 
{
	for(var yVal = 0; yVal < _height; yVal++)
	{
		var noise = 0.0;
		var scale = 1.0;
		var scaleAcc = 0.0;
		
		for (var o = 0; o < _octaves; o++)
		{
			var pitch = _width >> o;
			var sampleX1 = floor(xVal / pitch) * pitch;
			var sampleY1 = floor(yVal / pitch) * pitch;

			var sampleX2 = (sampleX1 + pitch) mod _width;
			var sampleY2 = (sampleY1 + pitch) mod _width;
			
			var blendX = (xVal - sampleX1) / pitch;
			var blendY = (yVal - sampleY1) / pitch;
			
			var sampleT = (1.0 - blendX) * _seed[sampleY1 * _width + sampleX1] + blendX * _seed[sampleY1 * _width + sampleX2];
			var sampleB = (1.0 - blendX) * _seed[sampleY2 * _width + sampleX1] + blendX * _seed[sampleY2 * _width + sampleX2];
			
			noise += (blendY * (sampleB - sampleT) + sampleT) * scale;
			scaleAcc += scale;
			scale = scale / _bias;
			
		}
		outputArr[yVal * _width + xVal] = noise / scaleAcc;
	}
}

return outputArr


