//
//  GetTweetDetailParams.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 20/3/22.
//

import Foundation

struct GetTweetDetailParams {
    
    var queryParams: [String: Any] {
        return ["expansions":"author_id", "user.fields": "name,profile_image_url,location,public_metrics", "tweet.fields":"public_metrics,geo"]
    }
}
