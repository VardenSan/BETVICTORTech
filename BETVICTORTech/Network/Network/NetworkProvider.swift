//
//  NetworkProvider.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

final class NetworkProvider {
    private let apiEndpoint: String
    private var headers: [String:String]

    public init() {
        apiEndpoint = "https://mytoys-code-challenge-api.herokuapp.com/api/"
        headers = [:]
    }
    
    public func makeNetwork<Element: Codable>() -> NetworkImp<Element> {
        let network = Network<Element>(apiEndpoint, headers: headers)
        return NetworkImp(network: network)
    }
}
