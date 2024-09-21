//
//  PsychadelicBackgroundView.swift
//  DeviceCornerRadius
//
//  Created by Wayne Dahlberg on 9/20/24.
//

import SwiftUI

struct GradientMetalBackgroundView: View {
  @State private var time: CGFloat = 0
  
  var body: some View {
    TimelineView(.animation) { _ in
      GeometryReader { geometry in
        Rectangle()
          .fill(.black)
          .colorEffect(
            ShaderLibrary.simplePsychedelicEffect(
              .float2(geometry.size),
              .float(time)
            )
          )
          .onAppear {
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
              time = 3
            }
          }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  GradientMetalBackgroundView()
}
