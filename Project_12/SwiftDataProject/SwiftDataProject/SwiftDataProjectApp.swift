//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ryan Hangralim on 03/04/25.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
