//
//  GradientBackgroundEffect.metal
//  DeviceCornerRadius
//
//  Created by Wayne Dahlberg on 9/20/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

[[ stitchable ]] half4 simplePsychedelicEffect(float2 position, half4 color, float2 size, float time) {
  float2 uv = position / size;
  float3 col = 0.5 + 0.5 * cos(time + uv.xyx + float3(0, 2, 4));
  return half4(half3(col), 1.0);
}

