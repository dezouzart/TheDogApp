import Quick
import Nimble

@testable import TheDogApp

class BreedModuleFactoryTests: QuickSpec {
    override class func spec() {
        describe("BreedModuleFactory") {
            describe(".create") {
                it("setups module properly") {
                    let view = BreedModuleFactory.create() as! BreedViewController
                    let interactor = view.interactor as! BreedInteractor
                    let presenter = interactor.presenter as! BreedPresenter
                    let presenterView = presenter.view as! BreedViewController
                    
                    expect(presenterView).to(equal(view))
                }
            }
        }
    }
}
