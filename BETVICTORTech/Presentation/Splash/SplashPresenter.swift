//
//  SplashPresenter.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import Foundation

protocol SplashPresenterView {
    func viewDidLoad()
}

class SplashPresenter: SplashPresenterView {
    
    let navigator: Navigator
    weak var viewController: SplashViewPresenter?
            
    init(navigator: Navigator) {
        self.navigator = navigator
    }
    
    func viewDidLoad() {
        navigator.toTweetList()
    }
    
    func setViewDelegate(viewController: SplashViewPresenter) {
        self.viewController = viewController
    }
}
