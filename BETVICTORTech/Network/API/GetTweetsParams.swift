//
//  GetTweetsParams.swift
//  BETVICTORTech
//
//  Created by Sergio TIMP on 19/3/22.
//

import Foundation

struct GetTweetParams {
    
    let search: String
    
    init(search: String) {
        self.search = search
    }
    
    var queryParams: [String: Any] {
        return ["query":search, "expansions":"author_id", "max_results": 20, "user.fields": "name,profile_image_url"]
    }
}
