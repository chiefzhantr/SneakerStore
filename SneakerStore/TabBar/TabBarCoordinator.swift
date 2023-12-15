import UIKit

final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let modulesFactory = TabBarModulesFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = modulesFactory.makeTabBar(
            with: [runHomeFlow(), runCartFlow(), runProfileFlow()],
            selectedTabBar: .home
        )
        navigationController.pushViewController(controller, animated: false)
    }
    
    private func runHomeFlow() -> UINavigationController {
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem.image = UIImage(systemName: "house.fill")
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator.start()
        return homeNavigationController
    }
    
    private func runCartFlow() -> UINavigationController {
        let cartNavigationController = UINavigationController()
        cartNavigationController.tabBarItem.image = UIImage(systemName: "cart.fill")
        let cartCoordinator = CartCoordinator(navigationController: cartNavigationController)
        cartCoordinator.start()
        return cartNavigationController
    }
    
    private func runProfileFlow() -> UINavigationController {
        let profileNavigationController = UINavigationController()
        profileNavigationController.tabBarItem.image = UIImage(systemName: "person.fill")
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
        profileCoordinator.start()
        return profileNavigationController
    }
}
