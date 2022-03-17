//
//  ProductsNavigator.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 6/3/22.
//

import UIKit

protocol Navigator {
    func toSplash()
    func toProductList()
    func toBasket(products: [Product])
}

class DefaultNavigator: Navigator {
    private let storyboard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider
    private let navigatorProvider: NavigatorProvider

    init(services: UseCaseProvider, navigatorProvider: NavigatorProvider,
         navigationController: UINavigationController,
         storyboard: UIStoryboard) {
        self.services = services
        self.navigatorProvider = navigatorProvider
        self.navigationController = navigationController
        self.storyboard = storyboard
    }
    
    func toSplash() {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeSplash()
        navigationController.pushViewController(vc, animated: true)
    }

    func toProductList() {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeProductList()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toBasket(products: [Product]) {
        navigatorProvider.navigationController = navigationController
        let vc = navigatorProvider.makeBasket(products: products)
        navigationController.pushViewController(vc, animated: true)
    }
}
