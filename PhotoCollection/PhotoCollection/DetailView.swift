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
            if let image = loadImage(from: photo.imageFileName) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .padding()
            } else {
                Text("Image not found")
            }
            Text(photo.name)
                .font(.title)
                .padding()
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    func loadImage(from filename: String) -> UIImage? {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(filename)
        return UIImage(contentsOfFile: url.path)
    }
}

//#Preview {
//    DetailView()
//}
