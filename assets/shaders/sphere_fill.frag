#version 460 core

#include <flutter/runtime_effect.glsl>

// The fill percentage (0.0 to 1.0)
uniform float uPercentage;
// Time for animation
uniform float uTime;
// Resolution of the drawing area
uniform vec2 uResolution;
// Color for the filled portion (RGBA)
uniform vec4 uFilledColor;
uniform vec4 uUnFilledColor;

out vec4 fragColor;

void main() {
    // Normalize fragment coordinates to be between -1.0 and 1.0, centered
    vec2 uv = (FlutterFragCoord().xy / uResolution.xy) * 2.0 - 1.0;

    // Aspect ratio correction (assuming height is the constraining dimension)
    uv.x *= uResolution.x / uResolution.y;

    // Calculate the distance from the center
    float distance_to_center = length(uv);

    // Define the sphere's radius
    float radius = 0.8; // Adjust as needed

    // Check if the fragment is inside the sphere
    if (distance_to_center <= radius) {
        // Calculate the vertical position within the sphere, normalized from 0 to 1
        // 0 is the bottom, 1 is the top
        float normalized_v = (uv.y + radius) / (2.0 * radius);

        // Create a wavy threshold based on percentage and time
        float wave_amplitude = 0.05; // Adjust wave intensity
        float wave_frequency = 3.0; // Adjust number of waves
        float wave_speed = 1.0;    // Adjust wave speed
        float wave_offset = sin(uv.x * wave_frequency + uTime * wave_speed) * wave_amplitude;

        // Adjust the percentage threshold with the wave
        float fill_threshold = uPercentage + wave_offset;

        // Determine if the fragment should be filled - INVERTED LOGIC HERE
        if (normalized_v >= 1.0 - fill_threshold) {
            fragColor = uFilledColor;
        } else {
            fragColor = uUnFilledColor;
        }
    } else {
        // Background color (transparent)
        fragColor = vec4(0.0, 0.0, 0.0, 0.0);
    }
}
