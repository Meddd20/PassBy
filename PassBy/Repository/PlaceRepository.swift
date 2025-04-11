//
//  PlaceRepository.swift
//  PassBy
//
//  Created by Medhiko Biraja on 10/04/25.
//

import SwiftData
import Foundation

class PlaceRepository {
    func toggleBookmark(
        name: String,
        address: String,
        latitude: Double,
        longitude: Double,
        type: PlaceType,
        context: ModelContext
    ) {
        let descriptor = FetchDescriptor<PlacePOI>(
            predicate: #Predicate {
                $0.placeLatitude == latitude && $0.placeLongitude == longitude
            }
        )
        
        if let existingPlace = try? context.fetch(descriptor).first {
            existingPlace.isBookmarked.toggle()
        } else {
            let newPlace = PlacePOI (
                placeName: name, placeAddress: address, placeLatitude: latitude, placeLongitude: longitude, placeType: type, isBookmarked: true
            )
            context.insert(newPlace)
        }
    }
    
    func isPlaceBookmarked(latitude: Double, longitude: Double, context: ModelContext) -> Bool {
        let descriptor = FetchDescriptor<PlacePOI>(
            predicate: #Predicate {
                $0.placeLatitude == latitude && $0.placeLongitude == longitude
            }
        )

        if let existingPlace = try? context.fetch(descriptor).first {
            return existingPlace.isBookmarked
        }

        return false
    }

}
