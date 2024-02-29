//
//  File.swift
//  
//
//  Created by Yuto on 2023/04/17.
//

import Foundation

extension CGSize {
    
    func divide(by number: CGFloat) -> CGSize {
        return CGSize(width: self.width/number, height: self.height/number)
    }
    
    func divide(by number: Int) -> CGSize {
        let number = CGFloat(number)
        return CGSize(width: self.width/number, height: self.height/number)
    }
    
}
