//
//  PlaceCard.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI

struct PlaceCard: View {
    var placeName: String
    var placeAddress: String
    var type: PlaceType
    
    @State private var isBookmarked: Bool = false
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            HStack {
                VStack (alignment: .leading, spacing: 4) {
                    Text(placeName)
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(1)
                    
                    Text(placeAddress)
                        .font(.system(size: 10, weight: .regular))
                        .lineLimit(1)
                }
                
                Spacer()
                
                Button (action: {
                    isBookmarked.toggle()
                }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 16))
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.black)
                        .background(
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                        )
                }
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .frame(maxWidth: .infinity, minHeight: 80, maxHeight: 80)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.customWhite)
            )
            
            PointOfInterestChip(placeType: type, isSelected: true)                
                .offset(x: -1, y: -18)
                            
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
}
