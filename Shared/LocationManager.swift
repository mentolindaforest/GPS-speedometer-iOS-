//
//  LocationManager.swift
//  gps_speedometer
//
//  Created by Mentol on 30/08/2022.
//

import Foundation
import CoreLocation
import Combine
import MapKit
import SwiftUI

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @Published var velocity: String = "?" {
        willSet { objectWillChange.send() }
    }
        
    override init() {
        super.init()
            
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.startUpdatingLocation()
    }
}
    
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        var s: Double = 3.6 * location!.speed
        if s < 0 {
            s = 0
        }
        self.velocity = String(format: "%0.f", s)
    }
}

