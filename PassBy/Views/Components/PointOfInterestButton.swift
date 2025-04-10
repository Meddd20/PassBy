//
//  PointOfInterestButton.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI

struct PointOfInterestButton: View {
    var placeType: PlaceType
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack {
                Image(systemName: placeType.icon)
                    .foregroundColor(placeType.color)
                    .padding()
                    .background(isSelected ? .customLightBlue : .customWhite)
                    .clipShape(Circle())
                
                Text(placeType.label)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.black)
            }
        }
    }
}
