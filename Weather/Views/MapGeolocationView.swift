//
//  MapGeolocationView.swift
//  Weather
//
//  Created by Alex on 6.09.22.
//

import SwiftUI
import MapKit

struct MapGeolocationView: View {
    
    @ObservedObject var viewModel = MapGeolocationViewModel()
    
    var body: some View {
        Spacer()
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .onAppear {
                viewModel.checkIfLocationServicesEnabled()
            }
    }
}

struct MapGeolocationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class MapGeolocationViewModel:NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33, longitude: -121.89), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            guard let locationManager = locationManager else {
                return
            }
            locationManager.delegate = self
        }
    }
    
    func checkLocationAuthorisation() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied location permission to this app. You can chage it in settings")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 53.893009, longitude: 27.567444),
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorisation()
    }
}
