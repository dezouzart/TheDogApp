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
        let newItems = viewModel.breedViewModelList

        collectionView.performBatchUpdates({
            breedViewModelList.append(contentsOf: newItems)
            let indexPaths = (breedViewModelList.count - newItems.count..<breedViewModelList.count).map {
                IndexPath(item: $0, section: 0)
            }
            collectionView.insertItems(at: indexPaths)
        }, completion: nil)
        
        isLoadingMoreItens = false
    }
}
