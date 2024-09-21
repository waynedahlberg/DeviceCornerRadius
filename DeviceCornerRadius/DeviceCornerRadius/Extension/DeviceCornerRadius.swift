//
//  DeviceCornerRadius.swift
//  ScreenCornersUI
//
//  Created by Wayne Dahlberg on 9/20/24.
//

import SwiftUI

/// Manages device-specific corner radius information
class DeviceCornerRadius: ObservableObject {
  /// The corner radius of the current device's display
  @Published var cornerRadius: CGFloat
  
  init() {
    self.cornerRadius = Self.calculateCornerRadius()
  }
  
  /// Calculates the corner radius based on the current device model
  private static func calculateCornerRadius() -> CGFloat {
    let screen = UIScreen.main
    let screenCorners = screen.displayCornerRadius
    
    // If the system provides a non-zero value, use it
    if screenCorners > 0 {
      return screenCorners
    }
    
    // Otherwise, fall back to our predefined values
    let screenSize = screen.bounds.size
    
    switch (screenSize.width, screenSize.height) {
    case (390, 844), (393, 852):  // iPhone 12, 13, 14, 15
      return 47.33
    case (428, 926), (430, 932):  // iPhone 12 Pro Max, 13 Pro Max, 14 Plus, 15 Plus
      return 53.33
    case (375, 812):  // iPhone X, XS, 11 Pro
      return 39.0
    case (414, 896):  // iPhone XR, 11
      return 41.5
    case (360, 780):  // iPhone 12 mini, 13 mini
      return 44.0
    case (393, 852):  // iPhone 14 Pro, 15 Pro
      return 55.0
    case (430, 932):  // iPhone 14 Pro Max, 15 Pro Max
      return 55.0
    case (428, 926):  // iPhone 16, 16 Plus (hypothetical)
      return 55.0
    case (436, 942):  // iPhone 16 Pro, 16 Pro Max (hypothetical)
      return 62.0
    case (744, 1133), (820, 1180), (834, 1194):  // iPad Air, iPad Pro 11-inch
      return 18.0
    case (1024, 1366):  // iPad Pro 12.9-inch
      return 18.0
    default:
      return 0  // Default to 0 for unknown devices
    }
  }
}

/// A view modifier to inject the DeviceCornerRadius into the environment
struct DeviceCornerRadiusModifier: ViewModifier {
  @StateObject private var cornerRadius = DeviceCornerRadius()
  
  func body(content: Content) -> some View {
    content
      .environmentObject(cornerRadius)
  }
}

extension View {
  /// Applies the DeviceCornerRadius to the view hierarchy
  func withDeviceCornerRadius() -> some View {
    modifier(DeviceCornerRadiusModifier())
  }
}


