//
//  DetailView.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import MapKit
import SwiftUI

struct DetailView: View {
    let photo: NamedPhoto
    
    // Map location
    var startPosition: MapCameraPosition {
        MapCameraPosition.region(
            MKCoordinateRegion (
                center: CLLocationCoordinate2D(latitude: photo.latitude ?? 0, longitude: photo.longitude ?? 0),
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
        )
    }

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
            
            // Show map if location exists
            if let latitude = photo.latitude, let longitude = photo.longitude {
                Map(initialPosition: startPosition){
                    // Place a pin on the map
                    Marker(photo.name, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                }
                .frame(height: 250) // Adjust map height
                .cornerRadius(12)
                .padding(.top)
                .padding(.horizontal)
            } else {
                Text("No Location Found")
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView()
//}
