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
    let publicMetrics: TweetPublicMetrics?
    let geo: GeoLocation?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case publicMetrics = "public_metrics"
        case geo
    }
}

struct TweetPublicMetrics: Codable {

    let retweetCount: Int?
    let replyCount: Int?
    let likeCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case retweetCount = "retweet_count"
        case replyCount = "reply_count"
        case likeCount = "like_count"
    }
}

struct GeoLocation: Codable {

    let coordinates: [Double]?
    
    enum CodingKeys: String, CodingKey {
        case coordinates
    }
}
