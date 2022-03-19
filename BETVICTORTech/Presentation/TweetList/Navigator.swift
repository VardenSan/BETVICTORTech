//
//  ProductsNavigator.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit

protocol Navigator: BaseNavigator {
    func toSplash()
    func toTweetList()
}

class DefaultNavigator: Navigator {
    private let storyboard: UIStoryboard
    private let navigationController: BaseNavigationController
    private let services: UseCaseProvider
    private let navigatorProvider: NavigatorProvider

    init(services: UseCaseProvider, navigatorProvider: NavigatorProvider,
         navigationController: BaseNavigationController,
         storyboard: UIStoryboard) {
        self.services = services
        self.navigatorProvider = navigatorProvider
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func toItem(item: Any, indexPath: IndexPath) {
        
    }
    
    func toSplash() {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeSplash()
        navigationController.pushViewController(vc, animated: true)
    }

    func toTweetList() {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeTweetList()
        navigationController.pushViewController(vc, animated: true)
    }
}
