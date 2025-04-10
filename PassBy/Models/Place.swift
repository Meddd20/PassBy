//
//  Place.swift
//  PassBy
//
//  Created by Medhiko Biraja on 09/04/25.
//

import Foundation

struct Place: Identifiable {
    var id = UUID()
    let placeName: String
    let placeAddress: String
    let placeLat: Double
    let placeLong: Double
    let placeType: PlaceType
    
    init(id: UUID = UUID(), placeName: String, placeAddress: String, placeLat: Double, placeLong: Double, placeType: PlaceType) {
        self.id = id
        self.placeName = placeName
        self.placeAddress = placeAddress
        self.placeLat = placeLat
        self.placeLong = placeLong
        self.placeType = placeType
    }
    
    
}

struct DummyData {
    static let places: [Place] = [
        Place(placeName: "Bali Bomb Memorial", placeAddress: "Kuta, Bali", placeLat: -8.7093, placeLong: 115.1691, placeType: .landmarks),
        Place(placeName: "Warung Nasi Ayam Bu Sri", placeAddress: "Denpasar, Bali", placeLat: -8.6705, placeLong: 115.2123, placeType: .eats),
        Place(placeName: "Warung Nasi Ayam Ibu Oki", placeAddress: "Jimbaran, Bali", placeLat: -8.7931, placeLong: 115.1766, placeType: .eats),
        Place(placeName: "Warung Liku Nakula", placeAddress: "Denpasar, Bali", placeLat: -8.6781, placeLong: 115.2084, placeType: .eats),
        Place(placeName: "Krisna Toko Oleh Oleh Khas Bali", placeAddress: "Kuta, Bali", placeLat: -8.7288, placeLong: 115.1761, placeType: .shops),
        Place(placeName: "Clandy's Mart Kediri", placeAddress: "Kediri, Tabanan, Bali", placeLat: -8.5682, placeLong: 115.0869, placeType: .shops),
        Place(placeName: "Patung Triratna Amreta Bhuwana", placeAddress: "Tabanan, Bali", placeLat: -8.5325, placeLong: 115.1209, placeType: .landmarks)
    ]
}
