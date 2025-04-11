//
//  PassByApp.swift
//  PassBy
//
//  Created by Medhiko Biraja on 08/04/25.
//

import SwiftUI
import SwiftData

@main
struct PassByApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                HomeView()
            }
        }
        .modelContainer(for: [PlacePOI.self])
    }
}
