//
//  UseCaseNetworkType.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Alamofire

public struct UseCaseNetworkType {
    
    let type: UseCaseType
    
    init(type: UseCaseType) {
        self.type = type
    }
    
    public var endpoint: String {
        switch type {
        case .getTweets(_):
            return "tweets/search/recent"
        case .getTweet(let id):
            return "tweets/\(id)"
        }
    }
    
    public var method: HTTPMethod {
        switch type {
        case .getTweets, .getTweet:
            return .get
        default:
            return .post
        }
    }
    
    public var params: [String: Any]? {
        switch type {
        case .getTweets(let params):
            return GetTweetParams(search: params).queryParams
        case .getTweet(_):
            return GetTweetDetailParams().queryParams
        default:
            return nil
        }
    }
}
