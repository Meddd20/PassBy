//
//  PostRunViewModel.swift
//  PassBy
//
//  Created by Medhiko Biraja on 10/04/25.
//

import SwiftUI
import SwiftData

class PostRunViewModel: ObservableObject {
    @Published var navigateToHome = false
    @Published var dateTime = Date.now
}
