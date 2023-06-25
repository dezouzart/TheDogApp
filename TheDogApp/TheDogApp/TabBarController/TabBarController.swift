import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = .darkGray
        self.tabBar.standardAppearance.selectionIndicatorTintColor = .seashell
        self.tabBar.unselectedItemTintColor = .white
    }
    
    func setViewControllers(_ viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, animated: false)
    }
}
