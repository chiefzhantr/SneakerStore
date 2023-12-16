import UIKit

final class TabBarViewController: UITabBarController {
    
    init(
        viewControllers: [UIViewController],
        selectedTabBar: TabBar?
    ) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
        
        if let selectedTabBar {
            configureSelectedTabBar(selectedTabBar)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func configureColors() {
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .black
        tabBar.barTintColor = .white
    }
    
    private func configureSelectedTabBar(_ tabBar: TabBar) {
        guard let index = TabBar.allCases.firstIndex(of: tabBar) else {
            return
        }

        selectedIndex = index
    }
    
    private func setup() {
        tabBar.isTranslucent = true
        configureColors()
    }
}
