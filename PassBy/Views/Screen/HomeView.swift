//
//  ContentView.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI
import MapKit
import CoreLocation

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
        
    var body: some View {
        VStack {
            NavigationLink(destination: RunningView()) {
                ZStack {
                    Map(position: $viewModel.position)
                        .opacity(0.3)
                        .frame(width: 290, height: 290)
                        .clipShape(.circle)
                        .allowsHitTesting(false)
                        .onAppear {
                            let defaultCoordinate = CLLocationCoordinate2D(latitude: -8.409518, longitude: 115.188919)
                            let coordinate = viewModel.locationManager.lastLocation?.coordinate ?? defaultCoordinate
                            print(coordinate)
                            
                            let camera = MapCamera(
                                centerCoordinate: coordinate,
                                distance: 10000,
                                heading: 0,
                                pitch: 0
                            )
                            viewModel.position = .camera(camera)
                        }
                    
                    Text("Start\nYour\nRun!")
                        .font(.system(size: 40, weight: .heavy))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.black)
                }
            }
            
            Spacer()
                .frame(height: 48)
                                    
            Text("🧭 Explore Your Surroundings")
                .font(.system(size: 20, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
            
            Spacer()
                .frame(height: 8)
            
            Text("All set! Just uncheck what you’re not into.")
                .font(.system(size: 14, weight: .light))
                .foregroundStyle(.black)
            
            Spacer()
                .frame(height: 20)
            
            HStack (spacing: 30){
                PointOfInterestButton(placeType: .eats, isSelected: viewModel.selectedType.contains(.eats)) {
                    viewModel.toggleSelection(for: .eats)
                }
                
                PointOfInterestButton(placeType: .landmarks, isSelected: viewModel.selectedType.contains(.landmarks)) {
                    viewModel.toggleSelection(for: .landmarks)
                }
                
                PointOfInterestButton(placeType: .scenery, isSelected: viewModel.selectedType.contains(.scenery)) {
                    viewModel.toggleSelection(for: .scenery)
                }
                
                PointOfInterestButton(placeType: .shops, isSelected: viewModel.selectedType.contains(.shops)) {
                    viewModel.toggleSelection(for: .shops)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    viewModel.navigateToSavedPlaces = true
                }) {
                    Image(systemName: "clock")
                        .padding()
                }
                .foregroundColor(Color.black.opacity(0.4))
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .padding()
        .onAppear{
            CLLocationManager().requestAlwaysAuthorization()
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.navigateToSavedPlaces) {
            SavedPlaceView()
        }
    }
}

#Preview {
    HomeView()
}
