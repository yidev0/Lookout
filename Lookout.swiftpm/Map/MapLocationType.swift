//
//  MapLocationType.swift
//  Lookout
//
//  Created by Yuto on 2023/04/15.
//

import Foundation
import MapKit

enum MapLocationType: String {
//    case any = "Any"
    case restaurant = "Restaurant"
    case cafe = "Cafe"
    case bar = "Bar"
    case hotel = "Hotel"
    case gasStation = "Gas station"
    case bank = "Bank"
    case hospital = "Hospital"
    case supermarket = "Supermarket"
    case pharmacie = "Pharmacy"
    case postOffice = "Post office"
    case school = "School"
    case park = "Park"
    case gym = "Gym"
    case museum = "Museum"
    case library = "Library"
}

extension MapLocationType {
    
    var query: String {
        switch self {
//        case .any:
//            return ""
        case .restaurant:
            return "Restaurants"
        case .cafe:
            return "Cafes"
        case .bar:
            return "Bars"
        case .hotel:
            return "Hotels"
        case .gasStation:
            return "Gas stations"
        case .bank:
            return "Banks"
        case .hospital:
            return "Hospitals"
        case .supermarket:
            return "Supermarkets"
        case .pharmacie:
            return "Pharmacies"
        case .postOffice:
            return "Post offices"
        case .school:
            return "Schools"
        case .park:
            return "Parks"
        case .gym:
            return "Gyms"
        case .museum:
            return "Museum"
        case .library:
            return "Libraries"
        }
    }
    
    var symbol: String {
        switch self {
//        case .any:
//            return "pin"
        case .restaurant:
            return "fork.knife"
        case .cafe:
            return "cup.and.saucer"
        case .bar:
            return "wineglass"
        case .hotel:
            return "bed.double.fill"
        case .gasStation:
            return "fuelpump.fill"
        case .bank:
            return "banknote.fill"
        case .hospital:
            return "cross.fill"
        case .supermarket:
            return "cart.fill"
        case .pharmacie:
            return "pills.fill"
        case .postOffice:
            return "envelope.fill"
        case .school:
            return "graduationcap.fill"
        case .park:
            return "figure.play"
        case .gym:
            return "dumbbell.fill"
        case .museum:
            return "building.columns.fill"
        case .library:
            return "books.vertical.fill"
        }
    }
    
    static var allTypes: [MapLocationType] {
        return [
//            .any,
            .restaurant,
            .cafe,
            .bar,
            .hotel,
            .gasStation,
            .bank,
            .hospital,
            .supermarket,
            .pharmacie,
            .postOffice,
            .school,
            .park,
            .gym,
            .museum,
            .library,
        ]
    }
    
}
