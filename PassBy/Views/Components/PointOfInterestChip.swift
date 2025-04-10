//
//  PointOfInterestChip.swift
//  PassBy
//
//  Created by Medhiko Biraja on 09/04/25.
//

import SwiftUI

struct PointOfInterestChip: View {
    var placeType: PlaceType
    var isSelected: Bool? = nil
    var onTap: (() -> Void)? = nil

    var body: some View {
        let selected = isSelected ?? false
        
        HStack {
            Image(systemName: placeType.icon)
                .font(.system(size: 18))
                .foregroundColor(placeType.color)
            
            Text(placeType.label)
                .font(.system(size: 14, weight: .regular))
        }
        .padding(8)
        .background(selected ? Color.customLightBlue : Color.customWhite)
        .cornerRadius(15)
        .onTapGesture {
            onTap?()
        }
    }
}
