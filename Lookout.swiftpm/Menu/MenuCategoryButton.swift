//
//  MenuCategoryButton.swift
//  
//
//  Created by Yuto on 2023/04/19.
//

import SwiftUI

struct MenuCategoryButton: View {
    
    @Binding var selectedCategory: MapLocationType
    var fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
    
    var body: some View {
        Menu {
            Picker(selection: $selectedCategory) {
                ForEach(MapLocationType.allTypes, id: \.self) { type in
                    Label(type.rawValue, systemImage: type.symbol)
                }
            } label: {
                label
            }.labelsHidden()
                .accessibilityLabel("Category")
        } label: {
            label
        }
    }
    
    var label: some View {
        ZStack {
            Circle()
                .foregroundStyle(.regularMaterial)
                .frame(width: fontSize + 32)

            Image(systemName: selectedCategory.symbol)
                .font(.title3)
        }
        .overlay {
            Circle()
                .stroke(lineWidth: 2)
        }
    }
    
}

struct MenuCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuCategoryButton(selectedCategory: .constant(.bank))
    }
}
