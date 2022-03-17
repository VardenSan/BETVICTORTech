//
//  Repository.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

final class RepositoryImp<Element: Codable>: Repository {
    
    private let network: NetworkImp<Element>
        
    init(network: NetworkImp<Element>) {
        self.network = network
    }
    
    func execute(type: UseCaseType, _ completion: @escaping (Result<Element, MyToysError>) -> Void) {
        return network.execute(type: UseCaseNetworkType(type: type), completion)
    }
}
