//
//  DetailView.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import SwiftUI

struct DetailView: View {
    let photo: NamedPhoto

    var body: some View {
        VStack {
            if let data = photo.imageData,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Text("Image not found")
                    .foregroundColor(.secondary)
            }

            Text(photo.name)
                .font(.title)
                .padding()
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView()
//}
