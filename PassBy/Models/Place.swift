//
//  Place.swift
//  PassBy
//
//  Created by Medhiko Biraja on 09/04/25.
//

import Foundation
import SwiftData

@Model
class PlacePOI {
    var placeName: String
    var placeAddress: String
    var placeLatitude: Double
    var placeLongitude: Double
    var placeType: PlaceType
    var isBookmarked: Bool
    
    init(placeName: String, placeAddress: String, placeLatitude: Double, placeLongitude: Double, placeType: PlaceType, isBookmarked: Bool) {
        self.placeName = placeName
        self.placeAddress = placeAddress
        self.placeLatitude = placeLatitude
        self.placeLongitude = placeLongitude
        self.placeType = placeType
        self.isBookmarked = isBookmarked
    }
}

struct DummyData {
    static let places: [PlacePOI] = [
        PlacePOI(placeName: "Bali Bomb Memorial", placeAddress: "Kuta, Bali", placeLatitude: -8.7093, placeLongitude: 115.1691, placeType: .landmarks, isBookmarked: false),
        PlacePOI(placeName: "Warung Nasi Ayam Bu Sri", placeAddress: "Denpasar, Bali", placeLatitude: -8.6705, placeLongitude: 115.2123, placeType: .eats, isBookmarked: false),
        PlacePOI(placeName: "Warung Nasi Ayam Ibu Oki", placeAddress: "Jimbaran, Bali", placeLatitude: -8.7931, placeLongitude: 115.1766, placeType: .eats, isBookmarked: false),
        PlacePOI(placeName: "Warung Liku Nakula", placeAddress: "Denpasar, Bali", placeLatitude: -8.6781, placeLongitude: 115.2084, placeType: .eats, isBookmarked: false),
        PlacePOI(placeName: "Krisna Toko Oleh Oleh Khas Bali", placeAddress: "Kuta, Bali", placeLatitude: -8.7288, placeLongitude: 115.1761, placeType: .shops, isBookmarked: false),
        PlacePOI(placeName: "Clandy's Mart Kediri", placeAddress: "Kediri, Tabanan, Bali", placeLatitude: -8.5682, placeLongitude: 115.0869, placeType: .shops, isBookmarked: false),
        PlacePOI(placeName: "Patung Triratna Amreta Bhuwana", placeAddress: "Tabanan, Bali", placeLatitude: -8.5325, placeLongitude: 115.1209, placeType: .landmarks, isBookmarked: false)
    ]
}
