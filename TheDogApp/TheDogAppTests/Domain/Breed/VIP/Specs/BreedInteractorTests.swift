import Quick
import Nimble

@testable import TheDogApp

class BreedInteractorTests: QuickSpec {
    override class func spec() {
        describe("BreedInteractor") {
            var sut: BreedInteractor!
            var presenterMock: BreedPresenterMock!
            var providerMock: BreedProviderMock!
            
            beforeEach {
                providerMock = BreedProviderMock()
                presenterMock = BreedPresenterMock()
                sut = BreedInteractor(breedProvider: providerMock)
                sut.presenter = presenterMock
            }
            
            describe(".fetchBreeds") {
                it("calls provider fetch") {
                    sut.fetchBreeds(request: .init())
                    
                    expect(providerMock.didCallFetchBreeds).to(beTrue())
                }
                
                context("when fetch fails") {
                    it("calls presenter presentError") {
                        providerMock.resultToReturn = .failure(RemoteRepositoryError.internalError)
                        
                        sut.fetchBreeds(request: .init())
                        
                        expect(presenterMock.didCallPresentError).toEventually(beTrue())
                    }
                }
                
                context("when fetch finishes with success") {
                    it("calls presenter presentBreed") {
                        providerMock.resultToReturn = .success(Breed.DataList(breedDataList: []))
                        
                        sut.fetchBreeds(request: .init())
                        
                        expect(presenterMock.didCallPresentBreed).toEventually(beTrue())
                    }
                }

            }
        }
    }
}
