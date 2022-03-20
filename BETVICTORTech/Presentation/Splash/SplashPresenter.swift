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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.navigator.toTweetList()
        }
    }
    
    func setViewDelegate(viewController: SplashViewPresenter) {
        self.viewController = viewController
    }
}
