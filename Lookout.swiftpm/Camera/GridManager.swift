//
//  File.swift
//  
//
//  Created by Yuto on 2023/04/15.
//

import Foundation
import SwiftUI
import Vision

class GridManager: NSObject, ObservableObject {
    
    static var shared = GridManager()
    
    public var rowCount: Int {
        didSet {
            setUpGrid()
        }
    }
    public var gridItems: [GridDescription] = [
        
    ]
    
    init(rowCount: Int = 3) {
        self.rowCount = rowCount
        super.init()
        setUpGrid()
    }
    
    private func setUpGrid() {
        gridItems = []
        for i in 0..<rowCount*rowCount {
            let newGrid = GridDescription(number: i, color: .clear)
            gridItems.append(newGrid)
        }
    }
    
    func updateGrids(for objects: [DetectedObject], bufferSize: CGSize) {
        var updatedGrid:Set<Int> = []
        for object in objects {
            let (coveredGrids, maxCoveredGrid) = getCoveredGrids(rect: object.rect, gridSize: bufferSize.divide(by: rowCount))
            print(coveredGrids, maxCoveredGrid ?? -1, gridItems.count)
            for gridNumber in coveredGrids {
                updatedGrid.insert(gridNumber)
                updateGrid(number: gridNumber, color: object.toColor())
            }
        }
        
        for i in 0..<rowCount*rowCount {
            if updatedGrid.contains(i) == false {
                updateGrid(number: i, color: .clear)
            }
        }
    }
    
    private func updateGrid(number: Int, color: Color) {
        if (gridItems.count - 1) < number { return }
        gridItems[number].color = color
    }
    
    private func getCoveredGrids(rect: CGRect, gridSize: CGSize) -> (coveredGrids: [Int], gridWithMostCoverage: Int?) {
        let totalGrids = rowCount*rowCount
        var coveredGrids: [Int] = []
        var maxCoverageGrid: Int?
        var maxCoverageArea: CGFloat = 0
        
        for i in 0..<totalGrids {
            let row = i / rowCount
            let col = (rowCount - 1) - (i % rowCount)
            
            let gridRect = CGRect(x: CGFloat(col) * gridSize.width,
                                  y: CGFloat(row) * gridSize.height,
                                  width: gridSize.width,
                                  height: gridSize.height)
            
            let intersection = rect.intersection(gridRect)
            let intersectionArea = intersection.width * intersection.height
            let coveredArea = intersectionArea / (rect.width * rect.height)
            
            let index = ((rowCount * rowCount) - 1) - i
            if coveredArea > 0.1 {
                coveredGrids.append(index)
                if intersectionArea > maxCoverageArea {
                    maxCoverageGrid = index
                    maxCoverageArea = intersectionArea
                }
            }
        }
        
        return (coveredGrids, maxCoverageGrid)
    }

    
}
