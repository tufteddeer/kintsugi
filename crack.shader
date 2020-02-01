shader_type canvas_item;

uniform vec4 color = vec4(0.6431, 0.5176, 0.2156, 1);
uniform float hi = 0.5;
uniform float lo = 0.25;
void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	
	if(tex.a < hi && tex.a > lo) {
		COLOR.rgba = color;
	} else {
		COLOR.rgba = vec4(0.0,0.0,0.0,1.0);
	}
	
}