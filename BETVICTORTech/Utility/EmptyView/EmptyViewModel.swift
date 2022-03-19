//
//  File.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

enum EmptyType {
    case tweetList
}

final class EmptyViewModel {
    
    let type: EmptyType
    
    init (with type: EmptyType) {
        self.type = type
    }
    
    var image: String {
        switch type {
        case .tweetList:
            return "splash"
        }
    }
    
    var title: String {
        switch type {
        case .tweetList:
            return "Ups!".localized()
        }
    }
    
    var subtitle: String {
        switch type {
        case .tweetList:
            return "Parece que no hay tweets".localized()
        }
    }
}
