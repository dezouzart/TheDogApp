import UIKit

class BreedModuleFactory: BreedCreationLogic {
    static func create() -> UIViewController {
        let presenter = BreedPresenter()
        let view = BreedViewController()
        let interactor = BreedInteractor()
        
        interactor.presenter = presenter
        view.interactor = interactor
        presenter.view = view
        
        return view
    }
}
