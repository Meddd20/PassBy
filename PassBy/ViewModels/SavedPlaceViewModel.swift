//
//  SavedPlaceViewModel.swift
//  PassBy
//
//  Created by Medhiko Biraja on 10/04/25.
//

import SwiftUI

class SavedPlaceViewModel: ObservableObject {
    @Published var navigateToHome = false
    @Published var isOn = false
    @Published var selectedType: PlaceType? = nil
    @Published var searchTerms = ""
    
    @Published var allPlaces: [PlacePOI] = [] {
        didSet {
            objectWillChange.send()
        }
    }
    
    var filteredPlaces: [PlacePOI] {
        allPlaces.filter { place in
            let isBookmarked = place.isBookmarked
            let matchFilter = selectedType == nil || place.placeType == selectedType
            let matchSearch = searchTerms.isEmpty || place.placeName.lowercased().contains(searchTerms.lowercased()) || place.placeAddress.lowercased().contains(searchTerms.lowercased())
            
            return isBookmarked && matchFilter && matchSearch
        }
    }
    
    func initialize(with places: [PlacePOI]) {
        self.allPlaces = places
    }
}
