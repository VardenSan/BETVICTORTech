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
    private let apiKey = "R9ejbZAXJ4U2S2005bH4UXmHK"
    private let apiKeySecret = "fehUkm3UTPIacknoxT8n9tewnPSzQt285R0kmdLGhpeCNrOHzj"
    private let bearerToken = "AAAAAAAAAAAAAAAAAAAAAMqXaQEAAAAAPxwwmy6nQMzpowsxFuWdfIpVwSI%3DFnxQEB0lUmA5sUoYMImG16EGKm2zIrtyAAFomnIS4TmaWaiJwl"
    
    private let clientId = "YVBONkt2bXJndnQ4QmpmYVpTcWs6MTpjaQ"
    private let clientSecret = "HRsSNlc2RLdY72dp0CrfCrX8dj6M39bS0ngN56F-QdwFYTXS4Z"

    public init() {
        apiEndpoint = "https://api.twitter.com/2/"
        headers = [:]
    }
    
    public func makeNetwork<Element: Codable>() -> NetworkImp<Element> {
        let network = Network<Element>(apiEndpoint, headers: headers)
        return NetworkImp(network: network)
    }
}
