//
//  PostRunView.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI

struct PostRunView: View {
    @StateObject private var viewModel = PostRunViewModel()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16) {
                Text("\(viewModel.dateTime.formatted(date: .long, time: .omitted)) | \(viewModel.dateTime.formatted(date: .omitted, time: .shortened))")
                    .font(.system(size: 14, weight: .light))

                Text("🏆 Run Complete!")
                    .font(.system(size: 32, weight: .heavy))
                    .padding(.vertical, 5)

                Text("Another run done! Along the way, you discovered some interesting spots. Check them out!")
                    .font(.system(size: 14, weight: .regular))
                    .lineSpacing(7)

                LazyVStack(spacing: 12) {
                    ForEach(DummyData.places) { place in
                        PlaceCard(placeName: place.placeName, placeAddress: place.placeAddress, type: place.placeType, latitude: place.placeLatitude, longitude: place.placeLongitude)
                            .background(Color.clear)
                            .contentShape(Rectangle())
                    }
                }
            }
            .padding()
        }
        .toolbar {
            ToolbarItem (placement: .topBarLeading) {
                Button (action: {
                    viewModel.navigateToHome = true
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black.opacity(0.2))
                }
            }
        }
        .toolbarBackground(Color.white, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.navigateToHome) {
            HomeView()
        }
        
    }
}

#Preview {
    PostRunView()
}
