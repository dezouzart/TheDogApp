import Foundation
import UIKit

class BreedPresenter: NSObject, BreedPresentationLogic {
    weak var view: BreedDisplayLogic?
    
    func presentBreed(response: Breed.Response) {
        var breedViewModelList = [Breed.BreedViewModel]()
        _ = response.breedList.map {
            breedViewModelList.append(
                Breed.BreedViewModel(
                    name: $0.name,
                    imageUrl: $0.imageUrl,
                    breedGroup: $0.breedGroup,
                    temperament: $0.temperament,
                    origin: $0.origin
                )
            )
        }
        view?.displayBreedList(
            viewModel: Breed.ViewModel(
                breedViewModelList: breedViewModelList
            )
        )
    }
    
    func presentError(message: String) {
        view?.presentAlert(title: Labels.Breed.Erros.title, message: message)
    }
    
    func showLoadingView() {
        view?.showLoadingView()
    }
    
    func hideLoadingView() {
        view?.hideLoadingView()
    }
}
