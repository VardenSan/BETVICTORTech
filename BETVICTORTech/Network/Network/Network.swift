//
//  Network.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation
import Alamofire

final class Network<T> {

    private let endPoint: String
    private var headers: [String:String]

    init(_ endPoint: String, headers: [String:String]) {
        self.endPoint = endPoint
        self.headers = headers
    }
    
    func makeRequest(type: UseCaseNetworkType, _ completion: @escaping (Result<Data, Error>) -> Void)  {
        let user = "code"
        let password = "challenge"
        let absolutePath = "\(endPoint)\(type.endpoint)"
        let httpHeaders = HTTPHeaders([
            .authorization(username: user, password: password)
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
}
