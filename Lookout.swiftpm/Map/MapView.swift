import SwiftUI
import MapKit

struct MapView: UIViewRepresentable { 
    var locationManager = CLLocationManager() 
 
    func setup() { // Set the location manager properties 
        locationManager.desiredAccuracy = kCLLocationAccuracyBest 
        locationManager.requestWhenInUseAuthorization() 
        locationManager.requestAlwaysAuthorization() 
    } 
    
    func makeUIView(context: Context) -> MKMapView {  
        setup()  
        let mapView = MKMapView(frame: UIScreen.main.bounds) 
        mapView.showsUserLocation = true 
        mapView.userTrackingMode = .follow 
        return mapView
    } 
    
    func updateUIView(_ mapView: MKMapView, context: Context) { 
        let center = CLLocationCoordinate2DMake(35.68083, 139.76724)
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        
        // POIフィルタリング(UIKitと使い方は変わらない)
        let category: [MKPointOfInterestCategory] = [.restaurant]
        let filter = MKPointOfInterestFilter(including: category)
        mapView.pointOfInterestFilter = filter
        
        // アノテーションを表示
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "アノテーションタイトル"
        mapView.addAnnotation(annotation)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
