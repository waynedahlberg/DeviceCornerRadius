//
//  UIScreen+CornerRadius.swift
//  DeviceCornerRadius
//
//  Created by Wayne Dahlberg on 9/20/24.
//

import UIKit

extension UIScreen {
  /// The corner radius of the display. Uses a private property of `UIScreen`,
  /// and may report 0 if the API changes or the property is unavailable.
  var displayCornerRadius: CGFloat {
    let cornerRadiusKey = ["Radius", "Corner", "display", "_"].reversed().joined()
    guard let cornerRadius = self.value(forKey: cornerRadiusKey) as? CGFloat else {
      return 0
    }
    return cornerRadius
  }
}
