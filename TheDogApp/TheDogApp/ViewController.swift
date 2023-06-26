import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        print("Tap action executada!")
        let viewController = ViewController()
        viewController.view.backgroundColor = .cyan
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
