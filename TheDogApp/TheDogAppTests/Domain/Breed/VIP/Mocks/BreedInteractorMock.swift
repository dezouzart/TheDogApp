import Foundation

@testable import TheDogApp

class BreedInteractorMock: BreedBusinessLogic {
    var didCallFetchBreeds = false
    
    func fetchBreeds(request: TheDogApp.Breed.Request) {
        didCallFetchBreeds = true
    }
}
