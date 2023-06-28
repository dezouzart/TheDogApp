import Foundation

@testable import TheDogApp

class BreedProviderMock: BreedRepository {
    var didCallFetchBreeds = false
    var resultToReturn: Result<Breed.DataList, Swift.Error> = .failure(RemoteRepositoryError.internalError)
    
    func fetchBreeds(dataRequest: Breed.DataRequest, completion: @escaping (Result<Breed.DataList, Swift.Error>) -> Void) {
        didCallFetchBreeds = true
        completion(resultToReturn)
    }
}
