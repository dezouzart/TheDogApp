import Quick
import Nimble

@testable import TheDogApp

class BreedPresenterTests: QuickSpec {
    override class func spec() {
        describe("BreedPresenter") {
            var sut: BreedPresenter!
            var viewMock: BreedViewMock!
            
            beforeEach {
                viewMock = BreedViewMock()
                sut = BreedPresenter()
                sut.view = viewMock
            }
            
            describe(".presentBreed") {
                it("calls view displayList") {
                    sut.presentBreed(response: .init(breedList: []))
                    
                    expect(viewMock.didCallDisplayList).to(beTrue())
                }
            }
            
            describe(".presentError") {
                it("calls view presentAlert") {
                    sut.presentError(message: "")
                    
                    expect(viewMock.didCallPresentAlert).to(beTrue())
                }
            }
            
            describe(".showLoadingView") {
                it("calls view showLoadingView") {
                    sut.showLoadingView()
                    
                    expect(viewMock.didCallShowLoadingView).to(beTrue())
                }
            }
            
            describe(".hideLoadingView") {
                it("calls view hideLoadingView") {
                    sut.hideLoadingView()
                    
                    expect(viewMock.didCallHideLoadingVIew).to(beTrue())
                }
            }
        }
    }
}
