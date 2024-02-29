//
//  File.swift
//  
//
//  Created by Yuto on 2023/04/17.
//

import Foundation
import SwiftUI

struct DetectedObject: Hashable {
    
    var id = UUID().uuidString
    var name: String
    var rect: CGRect
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func toColor() -> Color {
        switch name {
        case "Pedestrian Red":
            return .red
        case "Pedestrian Blue":
            return .blue
        default:
            return .clear
        }
    }
    
}

