//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Ryan Hangralim on 04/04/25.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
