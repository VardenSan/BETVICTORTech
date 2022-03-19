//
//  ProductViewModel.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation
import CloudKit
import UIKit

final class TweetViewModel: BaseViewModel<Tweet> {
    
    var user: User?
    var searchText: String = "I"
    
    required init(with tweet: Tweet) {
        super.init(with: tweet)
    }
    
    var name: String {
        return user?.name ?? ""
    }
    
    var avatarUrl: String {
        return user?.avatar ?? ""
    }
    
    var text: NSAttributedString {
        guard let text = element.text, let range = text.range(of: searchText) else { return NSAttributedString() }
        let attributedString = NSMutableAttributedString(string: text)
        let convertedRange = NSRange(range, in: text)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 17), range: convertedRange)
        return attributedString
    }
}
