//
//  AddPhotoView.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import PhotosUI
import SwiftData
import SwiftUI

struct AddPhotoView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var pickerItem: PhotosPickerItem?
    @State private var uploadedImage: Image?
    @State private var newName = ""
    @State private var tempUIImage: UIImage?

    var body: some View {
        Form {
            Section(header: Text("Photo")) {
                PhotosPicker(selection: $pickerItem, matching: .images) {
                    Label(uploadedImage == nil ? "Select a photo" : "Change photo", systemImage: "photo")
                        .foregroundColor(.blue)
                }
                
                if let image = uploadedImage {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                        .shadow(radius: 4)
                        .padding(.top, 8)
                }
            }
            
            Section(header: Text("Name")) {
                TextField("Photo name", text: $newName)
            }
            
            Section {
                Button(action: saveNamedPhoto) {
                    HStack {
                        Spacer()
                        Label("Save Photo", systemImage: "tray.and.arrow.down")
                        Spacer()
                    }
                }
                .disabled(tempUIImage == nil || newName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .navigationTitle("Add New Photo")
        .onChange(of: pickerItem) {
            Task {
                await handleSelectedPhoto()
            }
        }
    }

    func handleSelectedPhoto() async {
        guard let pickerItem else { return }
        
        do {
            if let data = try await pickerItem.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                uploadedImage = Image(uiImage: uiImage)
                tempUIImage = uiImage
            }
        } catch {
            print("❌ Failed to load image data: \(error)")
        }
    }

    @MainActor
    func saveNamedPhoto() {
        guard let image = tempUIImage else {
            print("❌ No temp image to save")
            return
        }

        if let data = image.jpegData(compressionQuality: 0.8) {
            let photo = NamedPhoto(name: newName, imageData: data)
            modelContext.insert(photo)

            do {
                try modelContext.save()
                print("✅ Successfully inserted \(photo.name)")
                dismiss()
            } catch {
                print("❌ Save failed: \(error)")
            }
        } else {
            print("❌ Error converting image to JPEG")
        }

        // Clear temporary state
        uploadedImage = nil
        newName = ""
        tempUIImage = nil
    }
}

#Preview {
    NavigationStack {
        AddPhotoView()
    }
}
