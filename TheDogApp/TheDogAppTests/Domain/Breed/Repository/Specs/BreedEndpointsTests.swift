import Quick
import Nimble

@testable import TheDogApp

class BreedEndpointsTests: QuickSpec {
    override class func spec() {
        describe("BreedEndpoints") {
            describe("when ask for request") {
                it("returns request with right url") {
                    let url = BreedEndpoints.breedList(page: 99).request?.url
                    
                    expect(url?.absoluteString).to(equal("https://api.thedogapi.com/v1/breeds?order=ASC&limit=24&page=99"))
                }
                
                it("returns request with right heaader") {
                    let headerValue = BreedEndpoints.breedList(page: 99).request?.value(forHTTPHeaderField: "x-api-key")
                    
                    expect(headerValue).toNot(beNil())
                    expect(headerValue).toNot(beEmpty())
                }
            }
        }
    }
}
