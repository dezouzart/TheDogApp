import Foundation
import UIKit

class BreedPresenter: NSObject, BreedPresentationLogic {
    weak var view: BreedDisplayLogic?
    private var breedList = [Breed.BreedModel]()
    
    func presentBreed(response: Breed.Response) {
        breedList = response.breedList
        var breedViewModelList = [Breed.BreedViewModel]()
        _ = response.breedList.map {
            breedViewModelList.append(
                Breed.BreedViewModel(
                    name: $0.name,
                    imageUrl: $0.imageUrl
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

extension BreedPresenter: UICollectionViewDataSource {
    func registerCells(for collectionView: UICollectionView) {
 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breedList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
}
