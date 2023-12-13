import UIKit

final class CartCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CartViewController()
        navigationController.pushViewController(controller, animated: false)
    }
}
