//
//  ProfileCoordinator.swift
//  SneakerStore
//
//  Created by Zhantore on 13.12.2023.
//

import Foundation
import UIKit

final class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProfileViewController()
        navigationController.pushViewController(controller, animated: false)
    }
}
