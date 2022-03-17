//
//  RepositoryProvider.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
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
