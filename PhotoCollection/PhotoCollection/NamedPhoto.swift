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
    var imageFileName: String
    var createdAt: Date
    
    init(id: UUID = UUID(), name: String, imageFileName: String, createdAt: Date = .now) {
        self.id = id
        self.name = name
        self.imageFileName = imageFileName
        self.createdAt = createdAt
    }
}
