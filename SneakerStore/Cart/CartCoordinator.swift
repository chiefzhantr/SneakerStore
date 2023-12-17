import UIKit

final class CartCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CartViewController()
        controller.actionButtonDidTap = { [weak self] in
            self?.presentSuccessOrder()
        }
        navigationController.pushViewController(controller, animated: false)
    }
    
    func presentSuccessOrder() {
        let controller = SuccessOrderViewController()
        controller.onFinish = { [weak self] in
            self?.navigationController.dismiss(animated: true)
        }
        navigationController.present(controller, animated: true)
    }
}
