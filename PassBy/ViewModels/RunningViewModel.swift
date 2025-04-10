//
//  RunningViewModel.swift
//  PassBy
//
//  Created by Medhiko Biraja on 10/04/25.
//

import SwiftUI

class RunningViewModel: ObservableObject {
    @Published var showBackAlert = false
    @Published var showEndAlert = false
    @Published var navigateToPostRun = false
}
