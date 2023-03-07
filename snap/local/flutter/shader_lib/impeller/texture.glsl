// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef TEXTURE_GLSL_
#define TEXTURE_GLSL_

#include <impeller/branching.glsl>

/// Sample from a texture.
///
/// If `y_coord_scale` < 0.0, the Y coordinate is flipped. This is useful
/// for Impeller graphics backends that use a flipped framebuffer coordinate
/// space.
vec4 IPSample(sampler2D texture_sampler, vec2 coords, float y_coord_scale) {
  if (y_coord_scale < 0.0) {
    coords.y = 1.0 - coords.y;
  }
  return texture(texture_sampler, coords);
}

vec2 IPRemapCoords(vec2 coords, float y_coord_scale) {
  if (y_coord_scale < 0.0) {
    coords.y = 1.0 - coords.y;
  }
  return coords;
}

/// Sample from a texture.
///
/// If `y_coord_scale` < 0.0, the Y coordinate is flipped. This is useful
/// for Impeller graphics backends that use a flipped framebuffer coordinate
/// space.
/// The range of `coods` will be mapped from [0, 1] to [half_texel, 1 -
/// half_texel]
vec4 IPSampleLinear(sampler2D texture_sampler,
                    vec2 coords,
                    float y_coord_scale,
                    vec2 half_texel) {
  coords.x = mix(half_texel.x, 1 - half_texel.x, coords.x);
  coords.y = mix(half_texel.y, 1 - half_texel.y, coords.y);
  return IPSample(texture_sampler, coords, y_coord_scale);
}

// These values must correspond to the order of the items in the
// 'Entity::TileMode' enum class.
const float kTileModeClamp = 0;
const float kTileModeRepeat = 1;
const float kTileModeMirror = 2;
const float kTileModeDecal = 3;

/// Remap a float using a tiling mode.
///
/// When `tile_mode` is `kTileModeDecal`, no tiling is applied and `t` is
/// returned. In all other cases, a value between 0 and 1 is returned by tiling
/// `t`.
/// When `t` is between [0 to 1), the original unchanged `t` is always returned.
float IPFloatTile(float t, float tile_mode) {
  if (tile_mode == kTileModeClamp) {
    t = clamp(t, 0.0, 1.0);
  } else if (tile_mode == kTileModeRepeat) {
    t = fract(t);
  } else if (tile_mode == kTileModeMirror) {
    float t1 = t - 1;
    float t2 = t1 - 2 * floor(t1 * 0.5) - 1;
    t = abs(t2);
  }
  return t;
}

/// Remap a vec2 using a tiling mode.
///
/// Runs each component of the vec2 through `IPFloatTile`.
vec2 IPVec2Tile(vec2 coords, float x_tile_mode, float y_tile_mode) {
  return vec2(IPFloatTile(coords.x, x_tile_mode),
              IPFloatTile(coords.y, y_tile_mode));
}

/// Sample a texture, emulating a specific tile mode.
///
/// This is useful for Impeller graphics backend that don't have native support
/// for Decal.
vec4 IPSampleWithTileMode(sampler2D tex,
                          vec2 coords,
                          float y_coord_scale,
                          float x_tile_mode,
                          float y_tile_mode) {
  if (x_tile_mode == kTileModeDecal && (coords.x < 0 || coords.x >= 1) ||
      y_tile_mode == kTileModeDecal && (coords.y < 0 || coords.y >= 1)) {
    return vec4(0);
  }

  return IPSample(tex, IPVec2Tile(coords, x_tile_mode, y_tile_mode),
                  y_coord_scale);
}

/// Sample a texture, emulating a specific tile mode.
///
/// This is useful for Impeller graphics backend that don't have native support
/// for Decal.
vec4 IPSampleWithTileMode(sampler2D tex,
                          vec2 coords,
                          float y_coord_scale,
                          float tile_mode) {
  return IPSampleWithTileMode(tex, coords, y_coord_scale, tile_mode, tile_mode);
}

/// Sample a texture, emulating a specific tile mode.
///
/// This is useful for Impeller graphics backend that don't have native support
/// for Decal.
/// The range of `coods` will be mapped from [0, 1] to [half_texel, 1 -
/// half_texel]
vec4 IPSampleLinearWithTileMode(sampler2D tex,
                                vec2 coords,
                                float y_coord_scale,
                                vec2 half_texel,
                                float x_tile_mode,
                                float y_tile_mode) {
  if (x_tile_mode == kTileModeDecal && (coords.x < 0 || coords.x >= 1) ||
      y_tile_mode == kTileModeDecal && (coords.y < 0 || coords.y >= 1)) {
    return vec4(0);
  }

  return IPSampleLinear(tex, IPVec2Tile(coords, x_tile_mode, y_tile_mode),
                        y_coord_scale, half_texel);
}

/// Sample a texture with decal tile mode.
vec4 IPSampleDecal(sampler2D texture_sampler, vec2 coords) {
  if (any(lessThan(coords, vec2(0))) ||
      any(greaterThanEqual(coords, vec2(1)))) {
    return vec4(0);
  }
  return texture(texture_sampler, coords);
}

/// Sample a texture, emulating a specific tile mode.
///
/// This is useful for Impeller graphics backend that don't have native support
/// for Decal.
/// The range of `coods` will be mapped from [0, 1] to [half_texel, 1 -
/// half_texel]
vec4 IPSampleLinearWithTileMode(sampler2D tex,
                                vec2 coords,
                                float y_coord_scale,
                                vec2 half_texel,
                                float tile_mode) {
  return IPSampleLinearWithTileMode(tex, coords, y_coord_scale, half_texel,
                                    tile_mode, tile_mode);
}

#endif
