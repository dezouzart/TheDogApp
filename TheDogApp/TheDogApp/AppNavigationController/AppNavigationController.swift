import UIKit

class AppNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return Themes.AppNavigation.preferredStatusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    private func configNavigationBar() {
        navigationBar.backgroundColor = Themes.AppNavigation.backgroundColor
        navigationBar.barTintColor = Themes.AppNavigation.backgroundColor
        navigationBar.tintColor = Themes.AppNavigation.tintColor
        navigationBar.isTranslucent = Themes.AppNavigation.isTranslucent
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        if let font = Themes.AppNavigation.titleText.font {
            navigationBar.titleTextAttributes = [
                .foregroundColor: Themes.AppNavigation.titleText.color,
                .font: font
            ]
        }
    }
}
