import Foundation

@testable import TheDogApp

class BreedPresenterMock: BreedPresentationLogic {
    var didCallPresentBreed = false
    var didCallPresentError = false
    var didCallShowLoadingView = false
    var didCallHideLoadingVIew = false
    
    func presentBreed(response: TheDogApp.Breed.Response) {
        didCallPresentBreed = true
    }
    
    func presentError(message: String) {
        didCallPresentError = true
    }
    
    func showLoadingView() {
        didCallShowLoadingView = true
    }
    
    func hideLoadingView() {
        didCallHideLoadingVIew = true
    }
}
