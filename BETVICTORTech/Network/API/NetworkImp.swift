//
//  NetworkImp.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Alamofire

public final class NetworkImp<Element: Codable> {
    private let network: Network<Element>

    init(network: Network<Element>) {
        self.network = network
    }
    
    public func execute(type: UseCaseNetworkType, _ completion: @escaping (Result<Element, BETVICTORError>) -> Void) {
        return network.makeRequest(type: type) { result in
            switch result {
            case .success(let data):
                guard let item = try? JSONDecoder().decode(Element.self, from: data) else {
                    guard let error = try? JSONDecoder().decode(BETVICTORError.self, from: data) else {
                        completion(.failure(BETVICTORError(errorCode: CommonError.COMMON_ERROR.rawValue)))
                        return
                    }
                    completion(.failure(error))
                    return
                }
                completion(.success(item))
            case .failure:
                completion(.failure(BETVICTORError(errorCode: CommonError.COMMON_ERROR.rawValue)))
            }
        }
    }
    
    public func execute(nextToken: String?, type: UseCaseNetworkType, _ completion: @escaping (Result<Element, BETVICTORError>) -> Void) {
        return network.makeRequest(nextToken: nextToken, type: type) { result in
            switch result {
            case .success(let data):
                guard let item = try? JSONDecoder().decode(Element.self, from: data) else {
                    guard let error = try? JSONDecoder().decode(BETVICTORError.self, from: data) else {
                        completion(.failure(BETVICTORError(errorCode: CommonError.COMMON_ERROR.rawValue)))
                        return
                    }
                    completion(.failure(error))
                    return
                }
                completion(.success(item))
            case .failure(_):
                completion(.failure(BETVICTORError(errorCode: CommonError.COMMON_ERROR.rawValue)))
            }
        }
    }
}
