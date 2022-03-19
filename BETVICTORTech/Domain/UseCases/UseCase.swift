//
//  UseCase.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

public protocol UseCase {
    associatedtype Item: Codable
    func execute(type: UseCaseType, _ completion: @escaping (Result<Item, BETVICTORError>) -> Void)
    func execute(nextToken: String, type: UseCaseType, _ completion: @escaping (Result<Item, BETVICTORError>) -> Void)
}
