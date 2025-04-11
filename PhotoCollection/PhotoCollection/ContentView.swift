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
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var uploadedImage: Image?
    @State private var showingNameAlert = false
    @State private var newName = ""
    @State private var tempUIImage: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Uploaded: \(namedPhotos.count)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Button("Fetch manually") {
                    let descriptor = FetchDescriptor<NamedPhoto>()
                    do {
                        let photos = try modelContext.fetch(descriptor)
                        print("🕵️‍♂️ Manual fetch: \(photos.count) items")
                        photos.forEach { print("→ \($0.name)") }
                    } catch {
                        print("❌ Fetch failed: \(error)")
                    }
                }
                
                PhotosPicker(selection: $pickerItem, matching: .images) {
                    Label("Add Photo", systemImage: "plus")
                        .padding()
                        .background(.blue.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

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
                            Text(photo.name)
                        }
                    }
                }
            }
            .navigationTitle("Saved Photos")
        }
        .onChange(of: pickerItem) {
            Task {
                await handleSelectedPhoto()
            }
        }
        .alert("Name this photo", isPresented: $showingNameAlert, actions: {
            TextField("Photo name", text: $newName)
            Button("Save", action: saveNamedPhoto)
            Button("Cancel", role: .cancel) { }
        })
    }

    func handleSelectedPhoto() async {
        guard let pickerItem else { return }
        
        do {
            if let data = try await pickerItem.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                uploadedImage = Image(uiImage: uiImage)
                tempUIImage = uiImage
                showingNameAlert = true
            }
        } catch {
            print("Failed to load image data: \(error)")
        }
    }
    
    @MainActor
    func saveNamedPhoto() {
        guard let image = tempUIImage else {
            print("❌ No temp image to save")
            return
        }
        
        if let data = image.jpegData(compressionQuality: 0.8){
            let photo = NamedPhoto(name: newName, imageData: data)
            modelContext.insert(photo)
            
            do {
                try modelContext.save()
                print("✅ Successfully inserted \(photo.name)")
            } catch {
                print("❌ Save failed: \(error)")
            }
        } else {
            print("Error saving image")
        }
        
        // clear tmp state
        uploadedImage = nil
        newName = ""
        tempUIImage = nil
    }

}

#Preview {
    ContentView()
}
