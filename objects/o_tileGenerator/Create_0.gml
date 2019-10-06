/// @description Insert description here

chunk_size = 16;
ww = 64; // window_get_width() / chunk_size;
wh = ww // window_get_width() / chunk_size;


octave = 5;
bias = 2.0;
show_debug_overlay(true)

seedArr = []
for(var i = 0; i <= ww * wh; i++) seedArr[i] = random(1);

// perlinNoise = sc_genPerlinNoise1D(ww, seedArr, octave, bias)
perlinNoise = sc_genPerlinNoise2D(ww, wh, seedArr, octave, bias)

