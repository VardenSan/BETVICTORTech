//
//  NavigatorProvider.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import UIKit

final class NavigatorProvider {
    
    private let services: UseCaseProvider
    public var navigationController: UINavigationController

    init(services: UseCaseProvider, navigationController: UINavigationController) {
        self.services = services
        self.navigationController = navigationController
    }
    
    func makeSplash() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigator = DefaultNavigator(services: services, navigatorProvider: self,
                navigationController: navigationController,
                storyboard: storyboard)
        let vc = storyboard.instantiateViewController(ofType: SplashViewController.self)
        let presenter = SplashPresenter(navigator: navigator, viewController: vc)
        vc.presenter = presenter
        return vc
    }
    
    func makeProductList() -> UIViewController {
        let storyboard = UIStoryboard(name: "Products", bundle: nil)
        let navigator = DefaultNavigator(services: services, navigatorProvider: self,
                navigationController: navigationController,
                storyboard: storyboard)
        let vc = storyboard.instantiateViewController(ofType: ProductListViewController.self)
        let presenter = ProductListPresenter(useCase: services.makeUseCase(),
                                                    navigator: navigator)
        vc.presenter = presenter
        presenter.setViewDelegate(viewController: vc)
        return vc
    }
    
    func makeBasket(products: [Product]) -> UIViewController {
        let storyboard = UIStoryboard(name: "Basket", bundle: nil)
        let navigator = DefaultNavigator(services: services, navigatorProvider: self,
                navigationController: navigationController,
                storyboard: storyboard)
        let vc = storyboard.instantiateViewController(ofType: BasketViewController.self)
        let presenter = BasketPresenter(useCase: services.makeUseCase(),
                                                    navigator: navigator, products: products)
        vc.presenter = presenter
        presenter.setViewDelegate(viewController: vc)
        return vc
    }

}
