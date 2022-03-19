//
//  RepositoryProvider.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

final class RepositoryProvider {
    
  private let networkProvider: NetworkProvider
    
  public init() {
      networkProvider = NetworkProvider()
  }
    
  public func makeRepository<Element>() -> RepositoryImp<Element> {
      return RepositoryImp(network: networkProvider.makeNetwork())
  }
}
