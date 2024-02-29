//
//  File.swift
//  
//
//  Created by Yuto on 2023/04/15.
//

import MapKit

extension MKPointOfInterestCategory {
    
    static var allTypes: [MKPointOfInterestCategory] {
        return [
            .airport, .amusementPark, .aquarium, .atm, .bank, .beach, .brewery, .cafe, .campground, .carRental, .evCharger, .fireStation, .fitnessCenter, .foodMarket, .gasStation, .hospital, .hotel, .laundry, .library, .marina, .movieTheater, .museum, .nationalPark, .nightlife, .park, .parking, .pharmacy, .police, .postOffice, .publicTransport, .restaurant, .restroom, .school, .stadium, .store, .theater, .university, .winery, .zoo
        ]
    }
    
    var symbol: String {
        switch self {
        case .airport:
            return "airplane"
        case .amusementPark:
            return "ticket.fill"
        case .aquarium:
            return "fish.fill"
        case .atm:
            return "banknote.fill"
        case .bank:
            return "banknote.fill"
        case .beach:
            return "beach.umbrella"
        case .brewery:
            return "mug"
        case .cafe:
            return "cup.and.saucer"
        case .campground:
            return "tent.fill"
        case .carRental:
            return "car.fill"
        case .evCharger:
            return "powerplug.fill"
        case .fireStation:
            return "fire.fill"
        case .fitnessCenter:
            return "figure.run"
        case .foodMarket:
            return "basket.fill"
        case .gasStation:
            return "fuelpump.fill"
        case .hospital:
            return "cross.fill"
        case .hotel:
            return "bed.double.fill"
        case .laundry:
            return "washer.fill"
        case .library:
            return "books.vertical.fill"
        case .marina:
            return "sailboat.fill"
        case .movieTheater:
            return "theatermasks.fill"
        case .museum:
            return "building.columns.fill"
        case .nationalPark:
            return "leaf"
        case .nightlife:
            return "wineglass"
        case .park:
            return "tree"
        case .parking:
            return "parkingsign"
        case .pharmacy:
            return "cross.fill"
        case .police:
            return "shield.fill"
        case .postOffice:
            return "envelope.fill"
        case .publicTransport:
            return "tram"
        case .restaurant:
            return "fork.knife"
        case .restroom:
            return "toilet"
        case .school:
            return "graduationcap.fill"
        case .stadium:
            return "sportscourt.fill"
        case .store:
            return "cart.fill"
        case .theater:
            return "theatermasks.fill"
        case .university:
            return "graduationcap.fill"
        case .winery:
            return "wineglass.fill"
        case .zoo:
            return "hare.fill"
        default:
            return "building.2.fill"
        }
    }
    
    var name: String {
        switch self {
        case .airport:
            return "airport"
        case .amusementPark:
            return "amusement park"
        case .aquarium:
            return "aquarium"
        case .atm:
            return "atm"
        case .bank:
            return "bank"
        case .beach:
            return "beach"
        case .brewery:
            return "brewery"
        case .cafe:
            return "cafe"
        case .campground:
            return "campground"
        case .carRental:
            return "car rental"
        case .evCharger:
            return "EV Charger"
        case .fireStation:
            return "fire station"
        case .fitnessCenter:
            return "fitness center"
        case .foodMarket:
            return "food market"
        case .gasStation:
            return "gas station"
        case .hospital:
            return "hospital"
        case .hotel:
            return "hotel"
        case .laundry:
            return "laundry"
        case .library:
            return "library"
        case .marina:
            return "marina"
        case .movieTheater:
            return "movie theater"
        case .museum:
            return "museum"
        case .nationalPark:
            return "national park"
        case .nightlife:
            return "nightlife"
        case .park:
            return "park"
        case .parking:
            return "parking"
        case .pharmacy:
            return "pharmacy"
        case .police:
            return "police"
        case .postOffice:
            return "post office"
        case .publicTransport:
            return "public transport"
        case .restaurant:
            return "restaurant"
        case .restroom:
            return "restroom"
        case .school:
            return "school"
        case .stadium:
            return "stadium"
        case .store:
            return "store"
        case .theater:
            return "theater"
        case .university:
            return "university"
        case .winery:
            return "winery"
        case .zoo:
            return "zoo"
        default:
            return ""
        }
    }

}
