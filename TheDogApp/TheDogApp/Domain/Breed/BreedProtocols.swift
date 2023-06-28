import UIKit

protocol BreedCreationLogic {
    static func create() -> UIViewController
}

protocol BreedDisplayLogic: UICollectionViewDelegate {
    func displayBreedList(viewModel: Breed.ViewModel)
    func showLoadingView()
    func hideLoadingView()
    func presentAlert(title: String, message: String)
}

protocol BreedPresentationLogic {
    func presentBreed(response: Breed.Response)
    func presentError(message: String)
    func showLoadingView()
    func hideLoadingView()
}

protocol BreedBusinessLogic {
    func fetchBreeds(request: Breed.Request)
}

protocol BreedRepository {
    func fetchBreeds(dataRequest: Breed.DataRequest, completion: @escaping (Result<Breed.DataList, Swift.Error>) -> Void)
}
