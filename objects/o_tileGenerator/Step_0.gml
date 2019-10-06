/// @description Insert description here
// You can write your code in this editor

if(mouse_check_button_pressed(mb_left)) {

	octave = (octave mod 5) + 1;
	bias = (bias + 2) mod 20;
	// perlinNoise = sc_genPerlinNoise1D(ww, seedArr, octave, bias);
	perlinNoise = sc_genPerlinNoise2D(ww, wh, seedArr, octave, bias);
}

if(keyboard_check_released(ord("U")))
{	
	octave = (octave mod 5) + 1;
	//perlinNoise = sc_genPerlinNoise1D(ww, seedArr, octave, bias);
	perlinNoise = sc_genPerlinNoise2D(ww, wh, seedArr, octave, bias);

}
if(keyboard_check_released(ord("J")))
{	
	octave = (octave - 1) mod 5;
	if(octave == 0) octave = 5;
	//perlinNoise = sc_genPerlinNoise1D(ww, seedArr, octave, bias);
	perlinNoise = sc_genPerlinNoise2D(ww, wh, seedArr, octave, bias);

}
if(keyboard_check_released(ord("N")))
{
	for(var i = 0; i < ww; i++) seedArr[i] = random(1);
	//perlinNoise = sc_genPerlinNoise1D(ww, seedArr, octave, bias);
	perlinNoise = sc_genPerlinNoise2D(ww, wh, seedArr, octave, bias);
}