//
//  UseCaseProvider.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

protocol UseCaseProvider {
    func makeUseCase<Element: Codable>() -> UseCaseImp<Element>
}
