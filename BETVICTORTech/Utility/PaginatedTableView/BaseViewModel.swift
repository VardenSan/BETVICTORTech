//
//  BaseViewModel.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

class BaseViewModel<Element> {
    
    let element: Element
    
    required init(with element: Element) {
        self.element = element
    }
    
}
