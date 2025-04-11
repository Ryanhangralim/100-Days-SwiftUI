//
//  ContentView.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import PhotosUI
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var namedPhotos: [NamedPhoto]
    
    var body: some View {
        NavigationStack {
            VStack {
                if namedPhotos.count > 0 {
                    List(namedPhotos) { photo in
                        NavigationLink(destination: DetailView(photo: photo)) {
                            HStack {
                                if let data = photo.imageData, let uiImage = UIImage(data: data) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                } else {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .overlay(
                                            Image(systemName: "photo")
                                                .foregroundColor(.gray)
                                        )
                                }
                                VStack(alignment: .leading) {
                                    Text(photo.name)
                                    
                                    Text(photo.createdAt.formatted(date: .abbreviated, time: .omitted))
                                        .font(.caption2)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                } else {
                    NavigationLink(destination: AddPhotoView()){
                        ContentUnavailableView("No Image(s) Yet", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }.buttonStyle(.plain)
                }
            }
            .toolbar {
                // Toolbar to add new activity
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: AddPhotoView()) {
                        Text("Add Photo")
                    }
                }
            }
            .navigationTitle("Photo Collection")
        }

    }

}

#Preview {
    ContentView()
}
