//
//  HomeViewModel.swift
//  PassBy
//
//  Created by Medhiko Biraja on 10/04/25.
//

import SwiftUI
import MapKit
import CoreLocation

class HomeViewModel: ObservableObject {
    @Published var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @Published var locationManager = LocationManager()
    @Published var navigateToSavedPlaces = false
    @Published var selectedType: Set<PlaceType> = [.eats, .landmarks, .scenery, .shops]
    
    func toggleSelection (for type: PlaceType) {
        if selectedType.contains(type) {
            if selectedType.count > 1 {
                selectedType.remove(type)
            }
        } else {
            selectedType.insert(type)
        }
    }
}
