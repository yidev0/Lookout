//
//  MenuButton.swift
//  
//
//  Created by Yuto on 2023/04/19.
//

import SwiftUI

struct MenuButton: View {
    
    var style: ViewStyle
    @Binding var selectedStyle: ViewStyle
    
    var fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
    
    var body: some View {
        Button {
            withAnimation {
                selectedStyle = style
            }
        } label: {
            label
        }
        .accessibilityLabel(buttonLabel)
        .accessibilityValue(buttonValue)
        .accessibilityAddTraits(traits)
    }
    
    var label: some View {
        ZStack {
            Circle()
                .foregroundStyle(.regularMaterial)
                .frame(width: fontSize + 32)

            Image(systemName: imageName)
                .font(.title3)
        }
        .overlay {
            Circle()
                .stroke(lineWidth: selectedStyle == style ? 4:2)
        }
    }
    
    var imageName: String {
        var returnValue = ""
        switch style {
        case .map:
            returnValue = "map"
        case .camera:
            returnValue = "camera"
        }
        
        returnValue += (selectedStyle == style) ? ".fill":""
        return returnValue
    }
    
    var buttonLabel: String {
        switch style {
        case .map:
            return "Map"
        case .camera:
            return "Camera"
        }
    }
    
    var buttonValue: String {
        switch style {
        case .map:
            return "tab, 1 of 2"
        case .camera:
            return "tab, 1 of 2"
        }
    }
    
    var traits: AccessibilityTraits {
        return selectedStyle == style ? [.isSelected]:[]
    }
    
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(style: .map, selectedStyle: .constant(.map))
    }
}
