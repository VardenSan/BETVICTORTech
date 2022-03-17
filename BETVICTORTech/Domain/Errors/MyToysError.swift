//
//  MyToysError.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

public struct MyToysError: Codable, Error {

    public let errorCode: String?

    public init(errorCode: String?) {
        self.errorCode = errorCode
    }
    
    enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
    }
    
    func toString() -> String {
        guard let errorCode = errorCode else { return "" }
        switch CommonError(rawValue: errorCode) {
        case .COMMON_ERROR:
            return "ERROR".localized()
        default:
            return ""
        }
    }
}
