import UIKit

extension BreedViewController: BreedDisplayLogic {
    func showLoadingView() {
        loadingSpinner.startAnimating()
    }
    
    func hideLoadingView() {
        loadingSpinner.stopAnimating()
    }
    
    func presentAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Labels.Alert.dismiss, style: .cancel)
        
        alert.addAction(cancelAction)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func displayBreedList(viewModel: Breed.ViewModel) {
        breedViewModelList = viewModel.breedViewModelList
        collectionView.reloadData()
    }
}
