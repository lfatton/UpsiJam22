shader_type canvas_item;

uniform vec4 main_color = vec4(0.0, 0.0, 1.0, 1.0);
uniform vec4 eye_color = vec4(0.0, 1.0, 0.0, 1.0);
uniform vec4 ear_color = vec4(1.0, 0.0, 0.0, 1.0);

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (COLOR == vec4(0.0, 0.0, 1.0, 1.0))
		COLOR = main_color;
	else if (COLOR == vec4(0.0, 1.0, 0.0, 1.0))
		COLOR = eye_color;
	else if (COLOR == vec4(1.0, 0.0, 0.0, 1.0))
		COLOR = ear_color;
}
