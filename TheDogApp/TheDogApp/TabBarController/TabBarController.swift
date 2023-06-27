import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = Themes.TabBar.backgroundColor
        tabBar.barTintColor = Themes.TabBar.backgroundColor
        tabBar.standardAppearance.selectionIndicatorTintColor = Themes.TabBar.selectionIndicatorTintColor
        tabBar.unselectedItemTintColor = Themes.TabBar.unselectedItemTintColor
        
        if let font = Themes.TabBar.font {
            UITabBarItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.font: font],
                for: .normal
            )
            UITabBarItem.appearance().setTitleTextAttributes(
                [NSAttributedString.Key.font: font],
                for: .selected
            )
        }
    }
    
    func setViewControllers(_ viewControllers: [UIViewController]) {
        setViewControllers(viewControllers, animated: false)
    }
}
