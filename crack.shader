shader_type canvas_item;

uniform float hi = 0.5;
uniform float lo = 0.25;
void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	
	if(tex.a < hi && tex.a > lo) {
		COLOR.rgba = vec4(0,1,0,1);
	} else {
		COLOR.rgba = tex
	}
	
}