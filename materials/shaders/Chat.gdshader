shader_type canvas_item;

uniform vec4 main_color = vec4(0.0, 0.0, 1.0, 1.0);
uniform vec4 secondary_color = vec4(0.0, 1.0, 1.0, 1.0);
uniform vec4 eye_color = vec4(0.0, 1.0, 0.0, 1.0);
uniform vec4 ear_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform float seed = 0.0;
uniform float pattern_strength = 1.0;

float rand(float small, float big, float uniqueness) {
	return small + (big - small) * fract(sin(dot(vec2(seed, uniqueness), vec2(12.9898, 4.1414))) * 43758.5453);
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (COLOR == vec4(0.0, 0.0, 1.0, 1.0)) {
		float striping = rand(0.0, 1.0, 2.0);
		float t =
			sin(UV.x * rand(35.0, 55.0, 0.0) + sin(UV.y * rand(18, 22.0, 1.0))) * striping  // stripes
			+ sin(UV.x * rand(40.0, 60.0, 3.0) + sin(UV.y * rand(18.0, 22.0, 4.0))) * sin(UV.y * rand(40.0, 60.0, 5.0) + sin(UV.x * rand(18.0, 22.0, 6.0))) * (1.0 - striping)  // spots
		;
		t *= pattern_strength;
		COLOR = t * main_color + (1.0 - t) * secondary_color;
	}
	else if (COLOR == vec4(0.0, 1.0, 0.0, 1.0))
		COLOR = eye_color;
	else if (COLOR == vec4(1.0, 0.0, 0.0, 1.0))
		COLOR = ear_color;
}
