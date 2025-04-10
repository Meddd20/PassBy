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
    @Published var savedPlaces: [Place] = DummyData.places
    
    var filteredPlaces: [Place] {
        savedPlaces.filter{ place in
            let matchFilter = selectedType == nil || place.placeType == selectedType
            let matchSearch = searchTerms.isEmpty || place.placeName.lowercased().contains(searchTerms.lowercased()) || place.placeAddress.lowercased().contains(searchTerms.lowercased())
            
            return matchFilter && matchSearch
        }
    }
    
}
