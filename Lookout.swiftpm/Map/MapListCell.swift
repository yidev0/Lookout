//
//  SwiftUIView.swift
//  
//
//  Created by Yuto on 2023/04/15.
//

import SwiftUI
import MapKit

struct MapListCell: View {
    
    var location: MapLocation
    var distance: Double
    
    var referenceSize = UIFont.preferredFont(forTextStyle: .title2).pointSize
    
    var body: some View {
        Button {
            location.openInMaps()
        } label: {
            HStack(spacing: 16) {
                ZStack {
                    Image(systemName: location.symbol)
                        .font(.title2)
                        .tint(TintShapeStyle())
                }
                .frame(width: referenceSize + 12)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(location.name)
                        .foregroundColor(.primary)
                    Text("Distance: \(Int(distance))m")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityValue(location.mapItem.pointOfInterestCategory?.name ?? "")
        }
    }
}

struct MapListCell_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MapListCell(
                location: MapLocation(
                    name: "Building",
                    mapItem: MKMapItem(
                        placemark: MKPlacemark(
                            coordinate: .init(),
                            addressDictionary: nil
                        )
                    )
                ),
                distance: 12.3
            )
            
            MapListCell(
                location: MapLocation(
                    name: "Building",
                    mapItem: MKMapItem(
                        placemark: MKPlacemark(
                            coordinate: .init(),
                            addressDictionary: nil
                        )
                    )
                ),
                distance: 12.3
            )
        }
    }
}
