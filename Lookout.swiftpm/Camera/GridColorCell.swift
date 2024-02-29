//
//  GridCell.swift
//  
//
//  Created by Yuto on 2023/04/19.
//

import SwiftUI

struct GridColorCell: View {
    
    var color: Color
    var index: Int
    
    init(items: [GridDescription], index: Int) {
        if (items.count - 1) < index {
            self.color = .clear
            self.index = 0
        } else {
            self.color = items[index].color
            self.index = index
        }
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(color.opacity(0.5))
            .overlay(alignment: .center) {
                Text("\(index + 1)")
            }
            .accessibilityLabel("Grid \(index + 1)")
            .accessibilityValue(value)
    }
    
    var value: String {
        switch color {
        case .red:
            return "Red"
        case .blue:
            return "Blue"
        default:
            return ""
        }
    }
    
}

struct GridCell_Previews: PreviewProvider {
    static var previews: some View {
        GridColorCell(items: [], index: 0)
    }
}
