//
//  CameraViewFinder.swift
//  Lookout
//
//  Created by Yuto on 2023/04/14.
//

import SwiftUI

struct CameraViewfinder: View {
    
    @Binding var image: Image?
    @State var isLandscape = false
    
    var body: some View {
        camera
            .ignoresSafeArea()
            .onReceive(
                NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            ) { _ in
                guard let scene = UIApplication.shared.currentUIWindow()?.windowScene else { return }
                self.isLandscape = scene.interfaceOrientation.isLandscape
            }
    }
    
    var camera: some View {
        ZStack {
            switch image {
            case .none:
                Rectangle()
                    .aspectRatio(isLandscape ? 4/3:3/4, contentMode: .fit)
            case .some(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct CameraViewfinder_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CameraViewfinder(image: .constant(
                Image(systemName: "camera.fill")
            ))
            .previewInterfaceOrientation(.portrait)
            
            CameraViewfinder(image: .constant(
                Image(systemName: "camera.fill")
            ))
            .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
