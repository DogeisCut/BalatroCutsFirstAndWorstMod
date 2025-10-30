#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define PRECISION highp
#else
    #define PRECISION mediump
#endif

// !! change this variable name to your Shader's name
// YOU MUST USE THIS VARIABLE IN THE vec4 effect AT LEAST ONCE

// Values of this variable:
// self.ARGS.send_to_shader[1] = math.min(self.VT.r*3, 1) + (math.sin(G.TIMERS.REAL/28) + 1) + (self.juice and self.juice.r*20 or 0) + self.tilt_var.amt
// self.ARGS.send_to_shader[2] = G.TIMERS.REAL
extern PRECISION vec2 unkempt;

extern PRECISION number dissolve;
extern PRECISION number time;
// [Note] sprite_pos_x _y is not a pixel position!
//        To get pixel position, you need to multiply  
//        it by sprite_width _height (look flipped.fs)
// (sprite_pos_x, sprite_pos_y, sprite_width, sprite_height) [not normalized]
extern PRECISION vec4 texture_details;
// (width, height) for atlas texture [not normalized]
extern PRECISION vec2 image_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

// [Required] 
// Apply dissolve effect (when card is being "burnt", e.g. when consumable is used)
vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv);

// This is what actually changes the look of card
vec4 effect( vec4 colour, Image texture, vec2 texture_coords, vec2 screen_coords )
{
    vec4 tex = Texel(texture, texture_coords);

    vec2 safe_ba = max(texture_details.ba, vec2(0.0001));
    vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*safe_ba) / safe_ba;

    number unkempt_strength = 0.5 + (unkempt.r * 0.01);

    // ---- Dirt & Grime ----
    number p1 = sin(uv.x * 25.0 + uv.y * 35.0 + time * 0.3 + unkempt_strength * 15.0);
    number p2 = cos(uv.x * 40.0 - uv.y * 20.0 + time * 0.4 + unkempt_strength * 12.0);
    number p3 = sin(uv.y * 50.0 + uv.x * 30.0 - time * 0.2 + unkempt_strength * 10.0);
    number dirt_pattern = (p1 + p2 + p3) / 3.0 + 0.5;

    number dirt_noise_detail = sin(uv.x * 70.0 + uv.y * 60.0 + time * 0.6 + unkempt_strength * 20.0);
    dirt_pattern = mix(dirt_pattern, dirt_noise_detail * 0.5 + 0.5, 0.4);

    vec3 dirt_color = vec3(0.15, 0.1, 0.05);
    tex.rgb = mix(tex.rgb, dirt_color, dirt_pattern * unkempt_strength * 0.7);

    float grayscale = dot(tex.rgb, vec3(0.299, 0.587, 0.114));
    tex.rgb = mix(tex.rgb, vec3(grayscale), unkempt_strength * 0.3);

    // ---- Scratches ----
    number scratch_scale_factor = 0.02;

    number scratch_noise1 = fract(sin(dot(uv * scratch_scale_factor, vec2(12.9898, 78.233))) * 43758.5453);
    number scratch_noise2 = fract(sin(dot(uv * scratch_scale_factor, vec2(99.432, 12.783))) * 92147.2345);
    number scratch_noise3 = fract(sin(dot(uv * scratch_scale_factor, vec2(56.789, 34.567))) * 51234.1234);
    number scratch_noise4 = fract(cos(dot(uv * scratch_scale_factor * 1.5 + vec2(0.1, 0.2), vec2(23.456, 87.654))) * 76543.2109);
    number scratch_noise5 = fract(sin(dot(uv * scratch_scale_factor * 0.8 - vec2(0.3, 0.1), vec2(34.567, 12.345))) * 19876.5432);
    number scratch_noise6 = fract(cos(dot(uv * scratch_scale_factor * 1.2 + vec2(0.5, 0.7), vec2(67.890, 43.210))) * 87654.3210);

    number complex_scratch_noise_a = sin(uv.x * scratch_scale_factor * 120.0 + cos(uv.y * 110.0) * 5.0 + time * 1.5 + unkempt_strength * 60.0);
    number complex_scratch_noise_b = cos(uv.y * scratch_scale_factor * 130.0 - sin(uv.x * 100.0) * 4.0 + time * 1.8 + unkempt_strength * 70.0);
    number complex_scratch_noise_c = sin((uv.x + uv.y) * scratch_scale_factor * 140.0 + cos(uv.x * 90.0) * 3.0 + time * 2.0 + unkempt_strength * 80.0);

    number scratch_mask1 = step(0.99, scratch_noise1); 
    number scratch_mask2 = step(0.985, scratch_noise2); 
    number scratch_mask3 = step(0.992, scratch_noise3); 
    number scratch_mask4 = step(0.988, scratch_noise4);
    number scratch_mask5 = step(0.991, scratch_noise5);
    number scratch_mask6 = step(0.987, scratch_noise6);

    number complex_scratch_mask_a = step(0.993, complex_scratch_noise_a * 0.5 + 0.5);
    number complex_scratch_mask_b = step(0.99, complex_scratch_noise_b * 0.5 + 0.5);
    number complex_scratch_mask_c = step(0.994, complex_scratch_noise_c * 0.5 + 0.5);

    //number diag_scratch_noise = sin((uv.x + uv.y) * scratch_scale_factor * 150.0 + time * 0.8 + unkempt_strength * 50.0);
    //number diag_scratch_mask = step(0.995, diag_scratch_noise);

    number total_scratch_mask = (scratch_mask1 + scratch_mask2 + scratch_mask3 + 
                                 scratch_mask4 + scratch_mask5 + scratch_mask6 + 
                                 complex_scratch_mask_a + complex_scratch_mask_b + complex_scratch_mask_c) * unkempt_strength;
    total_scratch_mask = min(total_scratch_mask, 1.0);

    vec3 scratch_color = vec3(0.05, 0.05, 0.05);
    tex.rgb = mix(tex.rgb, scratch_color, total_scratch_mask * 0.45);

    // ---- Edge Wear ----
    vec2 edge_fade = vec2(smoothstep(0.0, 0.1, uv.x), smoothstep(0.0, 0.1, uv.y));
    edge_fade.x *= smoothstep(1.0, 0.9, uv.x);
    edge_fade.y *= smoothstep(1.0, 0.9, uv.y);
    number edge_wear = (1.0 - edge_fade.x * edge_fade.y) * unkempt_strength * 0.4;

    tex.rgb = mix(tex.rgb, vec3(0.0), edge_wear);

    // General wear darkening
    tex.rgb -= vec3(0.03) * unkempt_strength;

    // Clamp all channels
    tex.rgb = clamp(tex.rgb, 0.0, 1.0);

    return dissolve_mask(tex * colour, texture_coords, uv);
}

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

    float t = time * 10.0 + 2003.;
    vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);
    
    vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
    vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
    vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

// for transforming the card while your mouse is on it
extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif