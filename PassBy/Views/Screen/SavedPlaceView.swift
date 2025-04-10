//
//  SavedPlaceView.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI

struct SavedPlaceView: View {
    @StateObject private var viewModel = SavedPlaceViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        PointOfInterestChip(
                            placeType: .eats,
                            isSelected: viewModel.selectedType == .eats,
                            onTap: {
                                viewModel.selectedType = viewModel.selectedType == .eats ? nil : .eats
                            }
                        )

                        PointOfInterestChip(
                            placeType: .landmarks,
                            isSelected: viewModel.selectedType == .landmarks,
                            onTap: {
                                viewModel.selectedType = viewModel.selectedType == .landmarks ? nil : .landmarks
                            }
                        )

                        PointOfInterestChip(
                            placeType: .scenery,
                            isSelected: viewModel.selectedType == .scenery,
                            onTap: {
                                viewModel.selectedType = viewModel.selectedType == .scenery ? nil : .scenery
                            }
                        )

                        PointOfInterestChip(
                            placeType: .shops,
                            isSelected: viewModel.selectedType == .shops,
                            onTap: {
                                viewModel.selectedType = viewModel.selectedType == .shops ? nil : .shops
                            }
                        )

                        Spacer()
                            .frame(height: 20)
                    }
                }
                .padding([.leading], 16)
                
                List(viewModel.filteredPlaces) { place in
                    Section {
                        PlaceCard(placeName: place.placeName, placeAddress: place.placeAddress, type: place.placeType)
                    }
                    .listRowInsets(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
                    .listRowSeparator(.hidden, edges: .all)
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                
            }
            .searchable(text: $viewModel.searchTerms, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look up a place you've saved")
            .navigationTitle("Saved Spots")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
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
            .navigationDestination(isPresented: $viewModel.navigateToHome) {
                HomeView()
            }
        }
    }
}

#Preview {
    SavedPlaceView()
}
