//
//  NavigatorProvider.swift
//  BETVICTORTech
//
//  Created by Sergio on 18/3/22.
//

import UIKit

final class NavigatorProvider {
    
    private let services: UseCaseProvider
    public var navigationController: BaseNavigationController

    init(services: UseCaseProvider, navigationController: BaseNavigationController) {
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
    
    func makeTweetList() -> UIViewController {
        let storyboard = UIStoryboard(name: "Tweets", bundle: nil)
        let navigator = DefaultNavigator(services: services, navigatorProvider: self,
                navigationController: navigationController,
                storyboard: storyboard)
        let vc = storyboard.instantiateViewController(ofType: TweetListViewController.self)
        let presenter = TweetListPresenter(useCase: services.makeUseCase(),
                                                    navigator: navigator)
        vc.presenter = presenter
        presenter.setViewDelegate(viewController: vc)
        return vc
    }
}
