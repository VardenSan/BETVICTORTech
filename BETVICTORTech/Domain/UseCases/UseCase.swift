//
//  UseCase.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

public protocol UseCase {
    associatedtype Item: Codable
    func execute(type: UseCaseType, _ completion: @escaping (Result<Item, MyToysError>) -> Void)
}
