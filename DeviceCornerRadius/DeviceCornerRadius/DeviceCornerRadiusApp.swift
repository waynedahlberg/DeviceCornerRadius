//
//  DeviceCornerRadiusApp.swift
//  DeviceCornerRadius
//
//  Created by Wayne Dahlberg on 9/20/24.
//

import SwiftUI

@main
struct DeviceCornerRadiusApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView()
          .withDeviceCornerRadius()
        }
    }
}
