//
//  NetworkImp.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Alamofire

public final class NetworkImp<Element: Codable> {
    private let network: Network<Element>

    init(network: Network<Element>) {
        self.network = network
    }
    
    public func execute(type: UseCaseNetworkType, _ completion: @escaping (Result<Element, MyToysError>) -> Void) {
        return network.makeRequest(type: type) { result in
            switch result {
            case .success(let data):
                guard let item = try? JSONDecoder().decode(Element.self, from: data) else {
                    guard let error = try? JSONDecoder().decode(MyToysError.self, from: data) else {
                        completion(.failure(MyToysError(errorCode: CommonError.COMMON_ERROR.rawValue)))
                        return
                    }
                    completion(.failure(error))
                    return
                }
                completion(.success(item))
            case .failure:
                completion(.failure(MyToysError(errorCode: CommonError.COMMON_ERROR.rawValue)))
            }
        }
    }
}
