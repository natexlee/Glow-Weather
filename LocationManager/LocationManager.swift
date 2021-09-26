//
//  LocationManager.swift
//  Glowing Weather
//
//  Created by Nate Lee on 9/10/21.
//

import CoreLocation


class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    @Published var cityLocal = ""
    @Published var twoD = CLLocationCoordinate2D()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        
        switch status {
        
        case .notDetermined:
            print("Not determinded")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedAlways:
            print("Authorized always")
        case .authorizedWhenInUse:
            print("Authorized when in use")
        @unknown default:
           break
        }
        
        
        func getCityName(of location: CLLocation) {
            CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
                if let placemark = placemarks?.first {
                    self.cityLocal = "\(placemark.locality ?? "")"
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}





