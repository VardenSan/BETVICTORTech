//
//  Network.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation
import Alamofire

final class Network<T> {

    private let endPoint: String
    private var headers: [String:String]
    private let bearerToken = "AAAAAAAAAAAAAAAAAAAAAMqXaQEAAAAAPxwwmy6nQMzpowsxFuWdfIpVwSI%3DFnxQEB0lUmA5sUoYMImG16EGKm2zIrtyAAFomnIS4TmaWaiJwl"

    init(_ endPoint: String, headers: [String:String]) {
        self.endPoint = endPoint
        self.headers = headers
    }
    
    func makeRequest(type: UseCaseNetworkType, _ completion: @escaping (Result<Data, Error>) -> Void)  {
        let absolutePath = "\(endPoint)\(type.endpoint)"
        let httpHeaders = HTTPHeaders([
            .authorization(bearerToken: bearerToken)
        ])
        AF.request(absolutePath, method: type.method, parameters: type.params, headers: httpHeaders)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func makeRequest(nextToken: String?, type: UseCaseNetworkType, _ completion: @escaping (Result<Data, Error>) -> Void)  {
        let absolutePath = "\(endPoint)\(type.endpoint)"
        var params = type.params ?? [:]
        let httpHeaders = HTTPHeaders([
            .authorization(bearerToken: bearerToken)
        ])
        if nextToken != nil {
            params.updateValue(nextToken!, forKey: "next_token")
        }

        AF.request(absolutePath, method: type.method, parameters: params, headers: httpHeaders)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
}
