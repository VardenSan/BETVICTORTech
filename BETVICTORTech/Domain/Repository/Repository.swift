//
//  Repository.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

protocol Repository {
    associatedtype Item: Codable
    func execute(type: UseCaseType, _ completion: @escaping (Result<Item, BETVICTORError>) -> Void)
}
