import Foundation
import UIKit

class BreedViewController: UIViewController, BreedDisplayLogic {
    var interactor: BreedBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Breed List"
        view.backgroundColor = .black
        
        interactor?.fetchBreeds(request: Breed.Request(page: 0))
    }
    
    func showLoadingView() {
        
    }
    
    func hideLoadingView() {
        
    }
    
    func presentAlert(title: String, message: String) {
        
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
    }
    
    func displayBreedList(viewModel: Breed.ViewModel) {
        
    }
}

extension BreedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
