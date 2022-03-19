//
//  Repository.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

final class RepositoryImp<Element: Codable>: Repository {
    
    private let network: NetworkImp<Element>
        
    init(network: NetworkImp<Element>) {
        self.network = network
    }
    
    func execute(type: UseCaseType, _ completion: @escaping (Result<Element, BETVICTORError>) -> Void) {
        return network.execute(type: UseCaseNetworkType(type: type), completion)
    }
    
    func execute(nextToken: String, type: UseCaseType, _ completion: @escaping (Result<Element, BETVICTORError>) -> Void) {
        return network.execute(nextToken: nextToken, type: UseCaseNetworkType(type: type), completion)
    }
}
