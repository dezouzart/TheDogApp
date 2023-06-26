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
        navigationBar.backgroundColor = .black
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        if let font = UIFont.helveticaNeueBold {
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.seashell, .font: font]
        }
    }
}
