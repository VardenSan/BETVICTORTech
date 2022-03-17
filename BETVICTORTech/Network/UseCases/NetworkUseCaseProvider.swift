//
//  NetworkUseCaseProvider.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
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

