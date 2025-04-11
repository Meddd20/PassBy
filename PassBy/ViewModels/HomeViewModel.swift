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
    @Published var selectedType: Set<PlaceType> = []

    init() {
        selectedType = loadSelectedTypes()
    }
    
    func updateMapCamera() {
        let defaultCoordinate = CLLocationCoordinate2D(latitude: -8.7368, longitude: 115.1759)
        let coordinate = locationManager.lastLocation?.coordinate ?? defaultCoordinate
        
        let camera = MapCamera(
            centerCoordinate: coordinate,
            distance: 1300,
            heading: 0,
            pitch: 60
        )
        
        position = .camera(camera)
    }
    
    func saveSelectedTypes (_ selected: Set<PlaceType>) {
        let rawValues = selected.map { $0.rawValue }
        UserDefaults.standard.set(rawValues, forKey: "selectedTypes")
    }
    
    func loadSelectedTypes() -> Set<PlaceType> {
        guard let saved = UserDefaults.standard.array(forKey: "selectedTypes") as? [String] else {
            return [.eats, .landmarks, .scenery, .shops]
        }
        
        return Set(saved.compactMap {PlaceType(rawValue: $0)})
    }

    
    func toggleSelection (for type: PlaceType) {
        if selectedType.contains(type) {
            if selectedType.count > 1 {
                selectedType.remove(type)
            }
        } else {
            selectedType.insert(type)
        }
        
        saveSelectedTypes(selectedType)
    }
}
