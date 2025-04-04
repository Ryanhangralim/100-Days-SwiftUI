//
//  User.swift
//  FriendFace
//
//  Created by Ryan Hangralim on 04/04/25.
//

import Foundation

@Observable
class User: Codable {
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
