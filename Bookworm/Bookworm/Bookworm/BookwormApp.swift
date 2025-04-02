//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ryan Hangralim on 01/04/25.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
