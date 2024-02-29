import SwiftUI
import MapKit
import CoreLocation

struct MapListView: View {
    
    @ObservedObject var locationManager = LocationManager.shared

    var body: some View {
        NavigationStack {
            List(locationManager.searchResults, id: \.self) { result in
                MapListCell(
                    location: result,
                    distance: result.distance(from: locationManager.currentLocation)
                )
            }
            .listStyle(.plain)
        }
    }
}

struct MapListView_Previews: PreviewProvider {
    static var previews: some View {
        MapListView()
    }
}
