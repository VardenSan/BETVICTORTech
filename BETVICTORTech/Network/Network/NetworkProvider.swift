//
//  NetworkProvider.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

final class NetworkProvider {
    private let apiEndpoint: String
    private var headers: [String:String]

    public init() {
        apiEndpoint = "https://api.twitter.com/2/"
        headers = [:]
    }
    
    public func makeNetwork<Element: Codable>() -> NetworkImp<Element> {
        let network = Network<Element>(apiEndpoint, headers: headers)
        return NetworkImp(network: network)
    }
}
