# DeviceCornerRadius
Access Apple device screen radii for SwiftUI views

![DeviceCornerRadius - Access screen radius for Apple devices](screenshot.jpg)

### Example view

```swift
struct ContentView: View {
  @EnvironmentObject var deviceCornerRadius: DeviceCornerRadius
  let padding: CGFloat = 8
  
  var body: some View {
    ZStack {
      {...}
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
```