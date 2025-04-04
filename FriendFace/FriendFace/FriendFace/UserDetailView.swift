//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Ryan Hangralim on 04/04/25.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    @State private var showFullAbout = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Basic Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                        .font(.largeTitle)
                        .bold()
                    
                    Text(user.isActive ? "Active 🟢" : "Inactive 🔴")
                        .font(.headline)
                        .foregroundColor(user.isActive ? .green : .red)
                }
                
                Divider()

                // Contact & Company
                VStack(alignment: .leading, spacing: 4) {
                    Label(user.email, systemImage: "envelope")
                    Label(user.company, systemImage: "building.2")
                    Label(user.address, systemImage: "house")
                }
                .font(.subheadline)

                Divider()

                // About Section
                VStack(alignment: .leading, spacing: 4) {
                    Text("About")
                        .font(.headline)

                    Text(user.about)
                        .font(.body)
                        .lineLimit(showFullAbout ? nil : 3)
                        .animation(.easeInOut, value: showFullAbout)

                    Button(action: {
                        showFullAbout.toggle()
                    }) {
                        Text(showFullAbout ? "Show less" : "Read more")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.top, 4)
                    }
                }

                // Registered
                VStack(alignment: .leading, spacing: 4) {
                    Text("Registered on")
                        .font(.headline)
                    Text(user.registered.formatted(date: .long, time: .shortened))
                }

                // Tags
                VStack(alignment: .leading, spacing: 4) {
                    Text("Tags")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(user.tags, id: \.self) { tag in
                                Text(tag)
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(Capsule().fill(Color.blue.opacity(0.2)))
                            }
                        }
                    }
                }

                // Friends
                VStack(alignment: .leading, spacing: 4) {
                    Text("Friends")
                        .font(.headline)
                    
                    ForEach(user.friends, id: \.id) { friend in
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.blue)
                            Text(friend.name)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    UserDetailView()
//}

