//
//  NamedPhoto.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import Foundation
import SwiftData

@Model
class NamedPhoto {
    var id: UUID
    var name: String
    var createdAt: Date
    
    @Attribute(.externalStorage)
    var imageData: Data?
    
    init(id: UUID = UUID(), name: String, createdAt: Date = .now, imageData: Data?) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.imageData = imageData
    }
}
