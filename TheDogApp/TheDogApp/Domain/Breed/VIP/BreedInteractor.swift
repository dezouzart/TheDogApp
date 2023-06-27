import Foundation

class BreedInteractor: BreedBusinessLogic {
    var presenter: BreedPresentationLogic?
    private let breedProvider: BreedRepository
    
    init(breedProvider: BreedRepository = BreedProvider()) {
        self.breedProvider = breedProvider
    }
    
    func fetchBreeds(request: Breed.Request) {
        presenter?.showLoadingView()
        breedProvider.fetchBreeds(dataRequest: request) { [weak self] result in
            switch result {
            case .failure(_):
                self?.completionError()
            case .success(let breedDataList):
                self?.completionSuccess(breedDataList)
            }
        }
    }
    
    private func completionError() {
        DispatchQueue.main.async {
            self.presenter?.hideLoadingView()
            self.presenter?.presentError(message: Labels.Breed.Erros.fetchMessage)
        }
    }
    
    private func completionSuccess(_ breedDataList: Breed.DataList) {
        var breedList = [Breed.BreedModel]()
        
        _ = breedDataList.breedDataList.map {
            guard let name = $0.name,
                  let imageUrlString = $0.image?.url,
                  let imageUrl = URL(string: imageUrlString) else {
                return
            }
            
            let breed = Breed.BreedModel(
                name: name,
                imageUrl: imageUrl,
                breedGroup:  $0.breedGroup,
                temperament: $0.temperament,
                origin: $0.origin
            )
            
            breedList.append(breed)
        }
        
        DispatchQueue.main.async {
            self.presenter?.hideLoadingView()
            self.presenter?.presentBreed(response: .init(breedList: breedList))
        }
    }
}
