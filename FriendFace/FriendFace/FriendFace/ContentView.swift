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

struct User: Codable, Identifiable {
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
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(users) { user in
                        NavigationLink(destination: Text("\(user.name)")/*UserDetailView(user: user)*/) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(user.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    
                                    Text(user.company)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }

                                Spacer()

                                HStack(spacing: 4) {
                                    Circle()
                                        .fill(user.isActive ? Color.green : Color.red)
                                        .frame(width: 10, height: 10)
                                    Text(user.isActive ? "Active" : "Inactive")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding()
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("FriendFace")
        }
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
