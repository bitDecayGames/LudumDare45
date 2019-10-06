//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 red_tint;
uniform vec3 green_tint;
uniform vec3 blue_tint;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float value = (base_col.r + base_col.g + base_col.b) / 3.0;
	vec3 red_mask = vec3(base_col.r * red_tint);
	vec3 green_mask = vec3(base_col.g * green_tint);
	vec3 blue_mask = vec3(base_col.b * blue_tint);

	gl_FragColor = vec4(red_mask + green_mask + blue_mask, base_col.a);
}