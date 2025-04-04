//
//  ContentView.swift
//  FriendFace
//
//  Created by Ryan Hangralim on 04/04/25.
//

import SwiftUI

// Create data types
struct Friend : Codable {
    var id: String
    var name: String
}

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}


struct ContentView: View {
    // Variable to store friends data
    @State private var users = [User]()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            if(users.isEmpty){
                print("Load data")
                await loadData()
            } else {
                print("data exist")
            }
        }
    }
    
    func loadData() async {
        // Craft URL
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }

        // Fetch data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            // decode data if valid
            do {
                let decodedUsers = try decoder.decode([User].self, from: data)
                users = decodedUsers
            } catch {
                print("Decoding failed: \(error)")
            }
        } catch {
            print("Failed to fetch data: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
