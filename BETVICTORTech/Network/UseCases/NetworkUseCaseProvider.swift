//
//  NetworkUseCaseProvider.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

final class NetworkUseCaseProvider: UseCaseProvider {
    
    private let repositoryProvider: RepositoryProvider

    init() {
        repositoryProvider = RepositoryProvider()
    }
    
    func makeUseCase<Element>() -> UseCaseImp<Element> {
        return UseCaseImp(repository: repositoryProvider.makeRepository())
    }
}

