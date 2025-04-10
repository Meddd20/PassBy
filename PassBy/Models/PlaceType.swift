//
//  PlaceType.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI

enum PlaceType {
    case eats, landmarks, scenery, shops
    
    var label: String {
        switch self {
            case .eats: return "Eats"
            case .landmarks: return "Landmarks"
            case .scenery: return "Scenery"
            case .shops: return "Shops"
        }
    }
    
    var icon: String {
        switch self {
            case .eats: return "fork.knife"
            case .landmarks: return "building.columns.fill"
            case .scenery: return "beach.umbrella.fill"
            case .shops: return "cart.fill"
        }
    }
    
    var color: Color {
        switch self {
            case .eats: return .customGrey
            case .landmarks: return .customBlue
            case .scenery: return .customGreen
            case .shops: return .customRed
        }
    }
}
