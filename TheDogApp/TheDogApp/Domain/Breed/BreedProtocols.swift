import UIKit

protocol BreedCreationLogic {
    static func create() -> UIViewController
}

protocol BreedDisplayLogic: UICollectionViewDelegate {
    func displayBreedList(viewModel: Breed.ViewModel)
    func showLoadingView()
    func hideLoadingView()
    func presentAlert(title: String, message: String)
    func pushViewController(_ viewController: UIViewController, animated: Bool)
}

protocol BreedPresentationLogic: UICollectionViewDataSource {
    func registerCells(for collectionView: UICollectionView)
    func presentBreed(response: Breed.Response)
}

protocol BreedBusinessLogic {
    func fetchBreeds(request: Breed.Request)
}