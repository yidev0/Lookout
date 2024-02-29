//
//  MenuView.swift
//  Lookout
//
//  Created by Yuto on 2023/04/19.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var style: ViewStyle
    @ObservedObject var locationManager: LocationManager
    
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                MenuButton(style: .map, selectedStyle: $style)
                MenuButton(style: .camera, selectedStyle: $style)
            }
            .padding()
            .background(.regularMaterial)
            .cornerRadius(16)
            
            if style == .map {
                ZStack {
                    MenuCategoryButton(selectedCategory: $locationManager.locationType)
                        .padding()
                }
                .background(.regularMaterial)
                .cornerRadius(16)
                .accessibilityLabel("Categories")
                .accessibilityAddTraits(.isHeader)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    
    @State static var style: ViewStyle = .map
    
    static var previews: some View {
        MenuView(style: $style, locationManager: LocationManager.shared)
    }
}
