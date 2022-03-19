//
//  UseCaseImp.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

final class UseCaseImp<Element: Codable>: UseCase {
    
    private let repository: RepositoryImp<Element>

    init(repository: RepositoryImp<Element>) {
        self.repository = repository
    }
    
    func execute(type: UseCaseType, _ completion: @escaping (Result<Element, BETVICTORError>) -> Void) {
        return repository.execute(type: type, completion)
    }
    
    func execute(nextToken: String, type: UseCaseType, _ completion: @escaping (Result<Element, BETVICTORError>) -> Void) {
        return repository.execute(nextToken: nextToken, type: type, completion)
    }
}
