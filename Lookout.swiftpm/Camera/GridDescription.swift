//
//  GridDescription.swift
//  Lookout
//
//  Created by Yuto on 2023/04/14.
//

import Foundation
import SwiftUI

class GridDescription: Hashable {
    static func == (lhs: GridDescription, rhs: GridDescription) -> Bool {
        lhs.number == rhs.number && lhs.color == rhs.color
    }
    
    var number: Int
    var color: Color
    
    init(number: Int, color: Color) {
        self.number = number
        self.color = color
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
}
