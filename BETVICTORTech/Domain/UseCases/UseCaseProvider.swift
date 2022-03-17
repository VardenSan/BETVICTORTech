//
//  UseCaseProvider.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

protocol UseCaseProvider {
    func makeUseCase<Element: Codable>() -> UseCaseImp<Element>
}
