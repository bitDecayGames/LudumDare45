//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 red_tint;
uniform vec3 green_tint;
uniform vec3 blue_tint;

uniform float uptime;

void main()
{
    vec4 base_col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	// Texture packing masks
	vec3 red_mask = vec3(base_col.r * red_tint);
	vec3 green_mask = vec3(base_col.g * green_tint);
	vec3 blue_mask = vec3(base_col.b * blue_tint);
	vec3 packed_tex = vec3(red_mask + green_mask + blue_mask);
	
	// Scan lines
	//vec2 offset = vec2(v_vTexcoord.x, mod(uptime, .5) + v_vTexcoord.y);
	//vec3 mask = vec3((v_vTexCoord.y + mod(uptime, .5)) * packed_tex);
	

	gl_FragColor = vec4(packed_tex, base_col.a);
}