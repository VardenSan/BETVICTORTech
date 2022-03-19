//
//  Tweet.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

struct Tweet: Codable {

    let id: String
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
    }
}
