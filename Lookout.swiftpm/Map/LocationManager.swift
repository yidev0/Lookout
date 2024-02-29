//
//  File.swift
//  
//
//  Created by Yuto on 2023/04/15.
//

import Foundation
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    static var shared = LocationManager()
    
    @Published var searchResults: [MapLocation] = []
    @Published var locationType: MapLocationType = .restaurant {
        didSet {
            if let userLocation = lastUpdatedLocation {
                requestLocations(userLocation: userLocation)
            }
        }
    }
    
    public var currentLocation: CLLocation? = nil
    private var lastUpdatedLocation: CLLocation? = nil
    
    private var locationManager = CLLocationManager()
    private var timeoutCounter: Double = 0
    
    override init() {
        super.init()
        self.initialize()
    }
    
    private func initialize() {
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        _ = Timer.scheduledTimer(
            timeInterval: 0.1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true
        )
    }
    
    func requestLocations(userLocation: CLLocation) {
        let request = MKLocalSearch.Request()
        
//        if locationType == .any {
//            request.naturalLanguageQuery = ""
//        } else {
            request.naturalLanguageQuery = locationType.query
//        }
        
        request.region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        searchLocations(request: request, userLocation: userLocation)
    }
    
    func searchLocations(request: MKLocalSearch.Request, userLocation: CLLocation) {
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            let mapItems = response.mapItems
            let sortedMapItems = mapItems.sorted(by: { (item1, item2) -> Bool in
                let distance1 = item1.placemark.location?.distance(from: userLocation) ?? Double.greatestFiniteMagnitude
                let distance2 = item2.placemark.location?.distance(from: userLocation) ?? Double.greatestFiniteMagnitude
                return distance1 < distance2
            })

            let nearbyLocations = Array(sortedMapItems.prefix(10))
            let results = nearbyLocations.map {
                MapLocation(
                    name: $0.name ?? "Unknown",
                    mapItem: $0
                )
            }
            self.searchResults = results
        }
    }
    
    @objc func timerFunction() {
        timeoutCounter += 0.1
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        currentLocation = userLocation
        
        if lastUpdatedLocation == nil {
            updateLocation(userLocation: userLocation)
        } else if
            let lastLocation = lastUpdatedLocation,
            lastLocation.distance(from: userLocation) > 15,
            timeoutCounter > 3{
            updateLocation(userLocation: userLocation)
        }
    }
    
    func updateLocation(userLocation: CLLocation) {
        print("location Update", timeoutCounter, lastUpdatedLocation?.distance(from: userLocation) ?? 0)

        self.lastUpdatedLocation = userLocation
        self.requestLocations(userLocation: userLocation)
        timeoutCounter = 0
    }
    
}
