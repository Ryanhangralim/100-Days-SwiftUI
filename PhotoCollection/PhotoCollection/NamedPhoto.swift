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
    var name: String
    var imageFileName: String
    var createdAt: Date
    
    init(name: String, imageFileName: String, createdAt: Date) {
        self.name = name
        self.imageFileName = imageFileName
        self.createdAt = createdAt
    }
}
