import UIKit

final class TabBarModulesFactory: NSObject {
    func makeTabBar(
        with viewControllers: [UIViewController],
        selectedTabBar: TabBar?
    ) -> UITabBarController {
        TabBarViewController(
            viewControllers: viewControllers,
            selectedTabBar: selectedTabBar
        )
    }
}
