//
//  RunningView.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI

struct RunningView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = RunningViewModel()

    var body: some View {
        VStack (){
            Spacer()
                .frame(height: 90)
            
            Text("Bali Bomb Memorial")
                .font(.system(size: 32, weight: .heavy))
                .multilineTextAlignment(.center)
                .frame(width: 294, alignment: .top)
            
            Spacer()
                .frame(height: 15)
            
            Text("Spotted 1000 meters from here")
                .font(.system(size: 16, weight: .light))
                .multilineTextAlignment(.center)
                .frame(width: 294, alignment: .top)
            
            Spacer()
                .frame(height: 45)
            
            Button(action: {
                viewModel.showEndAlert = true
            }) {
                Text("Wrap\nThings\nUp!")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundStyle(Color.customWhite)
                    .multilineTextAlignment(.center)
                    .frame(width: 290, height: 290)
                    .background(Color.customDarkBlue)
                    .clipShape(.circle)
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    viewModel.showBackAlert = true
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black.opacity(0.2))
                }
            }
        }
        .navigationTitle("Run in Progress")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Backtrack Your Steps?", isPresented: $viewModel.showBackAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Continue", role: .destructive) {
                dismiss()
            }
        } message: {
            Text("Places you've passed will be cleared. Proceed?")
        }
        .alert("Call It a Day?", isPresented: $viewModel.showEndAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Continue", role: .destructive) {
                viewModel.navigateToPostRun = true
            }
        } message: {
            Text("Stopping now means your current run ends here. Ready to finish up?")
        }
        .navigationDestination(isPresented: $viewModel.navigateToPostRun) {
            PostRunView()
        }
        
    }
}

#Preview {
    RunningView()
}
