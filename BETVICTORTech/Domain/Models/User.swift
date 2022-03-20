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
    let location: String?
    let publicMetrics: UserPublicMetrics?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatar = "profile_image_url"
        case username
        case location
        case publicMetrics = "public_metrics"
    }
}

struct UserPublicMetrics: Codable {

    let followersCount: Int?
    let followingCount: Int?
    let tweetCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case followersCount = "followers_count"
        case followingCount = "following_count"
        case tweetCount = "tweet_count"
    }
}
