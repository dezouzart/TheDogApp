import Quick
import Nimble

@testable import TheDogApp

class BreedProviderTests: QuickSpec {
    override class func spec() {
        describe("BreedProvider") {
            var sut: BreedProvider!
            var sessionMock: RemoteSessionMock!
            var expectedError: RemoteRepositoryError?
            
            beforeEach {
                sessionMock = RemoteSessionMock()
                sut = BreedProvider(session: sessionMock)
                expectedError = nil
            }
            
            describe(".fetchBreeds") {
                context("when session data come nil") {
                    it("fails as emptyResponseData") {
                        sut.fetchBreeds(dataRequest: Breed.DataRequest(page: 0)) { result in
                            switch result {
                            case .failure(let error):
                                expectedError = error as? RemoteRepositoryError
                            case .success(_):
                                break
                            }
                        }
                        
                        expect(expectedError).toEventually(equal(RemoteRepositoryError.emptyResponseData))
                    }
                }
                
                context("when session dataTask response come with error") {
                    it("fails as httpError") {
                        let anError = RemoteRepositoryError.internalError
                        sessionMock.errorToReturn = anError
                        
                        sut.fetchBreeds(dataRequest: Breed.DataRequest(page: 0)) { result in
                            switch result {
                            case .failure(let error):
                                expectedError = error as? RemoteRepositoryError
                            case .success(_):
                                break
                            }
                        }
                        
                        expect(expectedError).toEventually(equal(RemoteRepositoryError.httpError))
                    }
                }
            }
        }
    }
}

