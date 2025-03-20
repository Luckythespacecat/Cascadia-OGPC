shader_type canvas_item;

uniform float time_speed = 1.0;
uniform float wave_strength = .05;
uniform sampler2D noise_texture;

void fragment() {
    vec2 uv = UV;
    float time_offset = TIME * time_speed;

    // Sample noise for wave effect
    float noise = texture(noise_texture, uv + vec2(time_offset * 0.1, 0)).r;

    // Offset the UVs based on noise
    uv.y += sin(uv.x * 10.0 + time_offset) * wave_strength;
    uv.y += noise * wave_strength;

    // Sample the original texture
    vec4 color = texture(TEXTURE, uv);
    COLOR = color;
}
