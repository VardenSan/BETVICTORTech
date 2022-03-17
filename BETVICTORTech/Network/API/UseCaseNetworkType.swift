//
//  UseCaseNetworkType.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Alamofire

public struct UseCaseNetworkType {
    
    let type: UseCaseType
    
    init(type: UseCaseType) {
        self.type = type
    }
    
    public var endpoint: String {
        switch type {
        case .endpointWithParams(let id, _):
            return "api/\(id)"
        case .products:
            return "products"
        case .basket:
            return "basket"
        }
    }
    
    public var method: HTTPMethod {
        switch type {
        case .products, .basket:
            return .get
        default:
            return .post
        }
    }
    
    public var params: [String: Any]? {
        switch type {
        case .endpointWithParams(_, let params):
            return params
        default:
            return nil
        }
    }
}
