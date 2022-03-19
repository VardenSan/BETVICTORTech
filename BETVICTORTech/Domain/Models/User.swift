//
//  User.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 19/3/22.
//

import Foundation

struct User: Codable {

    let id: String
    let name: String?
    let avatar: String?
    let username: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatar = "profile_image_url"
        case username
    }
}
