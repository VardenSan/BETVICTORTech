//
//  Application.swift
//  myToysTechlab
//
//  Created by Sergio TIMP on 5/3/22.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()

    private let useCaseProvider: UseCaseProvider
    private var navigatorProvider: NavigatorProvider?

    private init() {
        self.useCaseProvider = NetworkUseCaseProvider()
    }

    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        navigatorProvider = NavigatorProvider(services: useCaseProvider, navigationController: navigationController)
        let splashNavigator = DefaultNavigator(services: useCaseProvider, navigatorProvider: navigatorProvider!,
                navigationController: navigationController,
                storyboard: storyboard)

        window.rootViewController = navigationController

        splashNavigator.toSplash()
    }
}

