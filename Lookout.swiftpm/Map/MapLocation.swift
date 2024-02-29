//
//  MapLocation.swift
//  Lookout
//
//  Created by Yuto on 2023/04/15.
//

import Foundation
import MapKit

struct MapLocation: Hashable {
    
    var name: String
    var mapItem: MKMapItem
    
    func openInMaps() {
        let mapItem = mapItem
        mapItem.openInMaps()
    }
    
    func distance(from location: CLLocation?) -> Double {
        if let selfLocation = mapItem.placemark.location,
           let location = location{
            return selfLocation.distance(from: location)
        }
        
        return Double.greatestFiniteMagnitude
    }
    
    var symbol: String {
        return mapItem.pointOfInterestCategory?.symbol ?? "building.2.fill"
    }
    
}
