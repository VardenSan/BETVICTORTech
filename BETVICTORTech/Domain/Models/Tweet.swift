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
    let location: String?
    let followersCount: Int?
    let userTweetCount: Int?
    let favouriteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case location
        case followersCount
        case userTweetCount
        case favouriteCount
    }
}
