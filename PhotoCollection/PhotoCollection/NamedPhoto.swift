//
//  NamedPhoto.swift
//  PhotoCollection
//
//  Created by Ryan Hangralim on 11/04/25.
//

import Foundation
import MapKit
import SwiftData

@Model
class NamedPhoto {
    var id: UUID
    var name: String
    var createdAt: Date
    var location: CLLocationCoordinate2D?
    
    @Attribute(.externalStorage)
    var imageData: Data?
    
    init(id: UUID = UUID(), name: String, createdAt: Date = .now, location = CLLocationCoordinate2D? = nil, imageData: Data?) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.location = location
        self.imageData = imageData
    }
}
