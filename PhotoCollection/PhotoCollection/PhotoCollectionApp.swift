//
//  PhotoCollectionApp.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import SwiftData
import SwiftUI

@main
struct PhotoCollectionApp: App {
    // Create a container with a name
    let container: ModelContainer

    init() {
        do {
            container = try ModelContainer(for: NamedPhoto.self, configurations: ModelConfiguration("PhotoModel"))
        } catch {
            fatalError("❌ Failed to create model container: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container) // inject into environment
        }
    }
}
