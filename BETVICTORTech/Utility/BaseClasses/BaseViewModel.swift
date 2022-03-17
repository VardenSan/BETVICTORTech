//
//  BaseViewModel.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation

class BaseViewModel<Element> {
    
    let element: Element
    
    required init(with element: Element) {
        self.element = element
    }
    
}
