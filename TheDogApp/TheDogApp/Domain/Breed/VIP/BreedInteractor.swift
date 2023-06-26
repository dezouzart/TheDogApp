import Foundation

class BreedInteractor: BreedBusinessLogic {
    var presenter: BreedPresentationLogic?
    private let breedProvider: BreedRepository
    
    init(breedProvider: BreedRepository = BreedProvider()) {
        self.breedProvider = breedProvider
    }
    
    func fetchBreeds(request: Breed.Request) {
        breedProvider.fetchBreeds(dataRequest: request) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error)")
            case .success(let breedDataList):
                print("Seccess: \(breedDataList)")
            }
        }
    }
}
