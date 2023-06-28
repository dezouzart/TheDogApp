import Foundation

@testable import TheDogApp

class BreedViewMock: NSObject, BreedDisplayLogic {
    var didCallPresentAlert = false
    var didCallShowLoadingView = false
    var didCallHideLoadingVIew = false
    var didCallDisplayList = false
    
    func displayBreedList(viewModel: TheDogApp.Breed.ViewModel) {
        didCallDisplayList = true
    }
    
    func showLoadingView() {
        didCallShowLoadingView = true
    }
    
    func hideLoadingView() {
        didCallHideLoadingVIew = true
    }
    
    func presentAlert(title: String, message: String) {
        didCallPresentAlert = true
    }
}
