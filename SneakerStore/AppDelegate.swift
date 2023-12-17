//
//  AppDelegate.swift
//  SneakerStore
//
//  Created by Admin  on 13.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarCoordinator: TabBarCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let accountService = AccountService()
            
        if accountService.isLogged() {
            let navigationController = UINavigationController()
            window?.rootViewController = navigationController
            tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
            tabBarCoordinator?.start()
        } else {
            let navigationController = UINavigationController(rootViewController: OnboardingViewController())
            navigationController.navigationBar.tintColor = .black
            window?.rootViewController = navigationController
            
        }
        
        return true
    }
}

