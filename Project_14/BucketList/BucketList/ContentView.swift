//
//  ContentView.swift
//  BucketList
//
//  Created by Ryan Hangralim on 07/04/25.
//

import MapKit
import SwiftUI

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    @State private var hybridMap = false

    var body: some View {
        if viewModel.isUnlocked {
            MapReader { proxy in
                ZStack {
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onTapGesture(count: 2) {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                    .mapStyle(hybridMap ? .hybrid : .standard)
                    
                    // 💡 Subtle toggle overlay
                    VStack {
                        HStack {
                            Spacer()
                            VStack(spacing: 4) {
                                Toggle("", isOn: $hybridMap)
                                    .labelsHidden()
                                Text("Hybrid Map")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                            }
                            .padding(10)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .padding()
                        }
                        Spacer()
                    }
                }
            }
        } else {
            // button here
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .alert("Authentication Failed", isPresented: $viewModel.authenticationFailed) { }
        }
    }

}



#Preview {
    ContentView()
}
