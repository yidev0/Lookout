//
//  CameraView.swift
//  Lookout
//
//  Created by Yuto on 2023/04/14.
//

import SwiftUI

struct CameraView: View {
    
    @StateObject private var model = DataModel()
    @StateObject private var gridManager = GridManager.shared
    
    var body: some View {
        NavigationStack {
            CameraViewfinder(image: $model.viewfinderImage)
                .overlay {
                    GridLineOverlayView(numberOfRows: gridManager.rowCount)
                    GridColorOverlayView(numberOfRows: gridManager.rowCount, items: gridManager.gridItems)
                }
                .task {
                    await model.camera.start()
                }
                .onDisappear {
                    model.camera.stop()
                }
        }
    }
    
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
