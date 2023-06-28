import Quick
import Nimble

@testable import TheDogApp

class BreedViewTests: QuickSpec {
    override class func spec() {
        describe("BreedView") {
            var sut: BreedViewController!
            var interactorMock: BreedInteractorMock!
            
            beforeEach {
                interactorMock = BreedInteractorMock()
                sut = BreedViewController()
                sut.interactor = interactorMock
            }
            
            describe("view did load") {
                it("calls interactor fetch") {
                    sut.viewDidLoad()
                    
                    expect(interactorMock.didCallFetchBreeds).to(beTrue())
                }
            }
        }
    }
}
