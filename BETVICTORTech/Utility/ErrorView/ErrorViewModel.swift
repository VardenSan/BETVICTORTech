//
//  ErrorViewModel.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

enum ErrorType {
    case tweetList
    case commonError
}

final class ErrorViewModel {
    
    private let type: ErrorType
    private let errorMessage: String
    
    init (with type: ErrorType, errorMessage: String) {
        self.type = type
        self.errorMessage = errorMessage
    }
    
    var image: String {
        switch type {
        default:
            return "empty-genericError"
        }
    }
    
    var title: String {
        switch type {
        default:
            return "An error has ocurred".localized()
        }
    }
    
    var subtitle: String {
        return errorMessage
    }
    
    var buttonText: String {
        switch type {
        default:
            return "Retry".localized()
        }
    }
}
