//
//  ContentView.swift
//  ScreenCornersUI
//
//  Created by Wayne Dahlberg on 9/20/24.
//

// ContentView.swift

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var deviceCornerRadius: DeviceCornerRadius
  let padding: CGFloat = 8
  
  var body: some View {
    ZStack {
      GradientMetalBackgroundView()
      VStack {
        Spacer()
        VStack(spacing: 0) {
          Text("Screen corner radius:")
            .font(.system(size: 24, weight: .semibold, design: .rounded))
            .foregroundStyle(.thinMaterial)
          Text("\(deviceCornerRadius.cornerRadius, specifier: "%.2f")")
            .font(.system(size: 96, weight: .bold, design: .rounded))
            .foregroundStyle(.thinMaterial)
        }
        .padding(.vertical, 64)
        Spacer()
        Rectangle()
          .fill(Color.white)
          .frame(width: .infinity, height: 360)
          .clipShape(RoundedRectangle(cornerRadius: ((deviceCornerRadius.cornerRadius) - padding), style: .continuous))
          .padding(padding)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }
}

#Preview {
  ContentView()
    .withDeviceCornerRadius()
}
