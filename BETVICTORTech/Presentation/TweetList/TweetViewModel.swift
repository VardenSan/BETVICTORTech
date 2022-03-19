//
//  ProductViewModel.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation
import CloudKit

final class TweetViewModel: BaseViewModel<Tweet> {
    
    var user: User?
    
    required init(with tweet: Tweet) {
        super.init(with: tweet)
    }
    
    var name: String {
        return user?.name ?? ""
    }
    
    var avatarUrl: String {
        return user?.avatar ?? ""
    }
    
    var text: String {
        return element.text ?? ""
    }
}
