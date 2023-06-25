import UIKit

class AppNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
    }
    
    private func configNavigationBar() {
        self.navigationBar.barTintColor = .darkGray
        self.navigationBar.tintColor = .seashell
        self.navigationBar.isTranslucent = false
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        
        if let font = UIFont.helveticaNeueBold {
            self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.seashell, .font: font]
        }
    }
}
