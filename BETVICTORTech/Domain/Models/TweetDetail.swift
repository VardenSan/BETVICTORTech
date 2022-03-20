//
//  TweetDetail.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 20/3/22.
//

import Foundation

struct TweetDetail: Codable {
    let data: Tweet
    let includes: IncludeData?

    enum CodingKeys: String, CodingKey {
        case data
        case includes
    }
}
