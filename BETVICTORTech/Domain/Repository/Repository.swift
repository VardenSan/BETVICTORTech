//
//  Repository.swift
//  myToysTechlab (iOS)
//
//  Created by Sergio TIMP on 7/3/22.
//

import Foundation

protocol Repository {
    associatedtype Item: Codable
    func execute(type: UseCaseType, _ completion: @escaping (Result<Item, MyToysError>) -> Void)
}
