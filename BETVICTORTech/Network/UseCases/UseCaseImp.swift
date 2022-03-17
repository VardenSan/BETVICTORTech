//
//  UseCaseImp.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//
import Foundation

final class UseCaseImp<Element: Codable>: UseCase {
    
    private let repository: RepositoryImp<Element>

    init(repository: RepositoryImp<Element>) {
        self.repository = repository
    }
    
    func execute(type: UseCaseType, _ completion: @escaping (Result<Element, MyToysError>) -> Void) {
        return repository.execute(type: type, completion)
    }
}
