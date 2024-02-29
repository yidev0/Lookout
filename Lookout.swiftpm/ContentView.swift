import SwiftUI

struct ContentView: View {
    
    @State var style: ViewStyle = .map
    @StateObject var locationManager = LocationManager.shared
    
    @AccessibilityFocusState var isListFocused
    
    var body: some View {
        ZStack {
            switch style {
            case .map:
                MapListView(locationManager: locationManager)
                    .accessibilityFocused($isListFocused)
                    .accessibilitySortPriority(2)
            case .camera:
                CameraView()
                    .accessibilitySortPriority(2)
            }
            
            VStack {
                Spacer()
                HStack {
                    MenuView(style: $style,locationManager: locationManager)
                    Spacer()
                }
            }
            .padding()
            .accessibilitySortPriority(1)
        }
        .onAppear {
            isListFocused = true
        }
        .onChange(of: style) { newValue in
            if newValue == .map {
                isListFocused = true
            }
        }
        .onChange(of: locationManager.locationType) { newValue in
            isListFocused = true
        }
    }
    
}
