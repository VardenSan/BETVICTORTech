//
//  SplashPresenter.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 6/3/22.
//

import Foundation

protocol SplashPresenterView {
    func viewDidLoad()
}

class SplashPresenter: SplashPresenterView {
    
    let navigator: Navigator
    let viewController: SplashViewPresenter
            
    init(navigator: Navigator, viewController: SplashViewPresenter) {
        self.navigator = navigator
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        navigator.toProductList()
    }
}
