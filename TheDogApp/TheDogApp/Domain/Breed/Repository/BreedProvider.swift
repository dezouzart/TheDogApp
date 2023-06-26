import Foundation

class BreedProvider: BreedRepository {
    private let session: RemoteSession
    private let jsonParser: JSONParserLogic
    
    init(session: RemoteSession = SystemRemoteSession(),
         jsonParser: JSONParserLogic = ResourceJSONParser()) {
        self.session = session
        self.jsonParser = jsonParser
    }
    
    func fetchBreeds(dataRequest: Breed.Request, completion: @escaping (Result<Breed.DataList, Error>) -> Void) {
        guard let request = BreedEndpoints.breedList(page: dataRequest.page).request else {
            completion(.failure(RemoteRepositoryError.requestInvalid))
            return
        }
        
        let task = session.dataTask(request: request) { [weak self] (data, response, error) in
            if error != nil {
                completion(.failure(RemoteRepositoryError.httpError))
                return
            }
            
            guard let data = data else {
                completion(.failure(RemoteRepositoryError.emptyResponseData))
                return
            }
            
            guard let context = self else {
                completion(.failure(RemoteRepositoryError.unableToRetrieveData))
                return
            }
            
            do {
                let breedDataResponse = try context.jsonParser.decode(
                    [Breed.Data].self,
                    from: data
                )
                completion(.success(Breed.DataList(breedDataList: breedDataResponse)))
            } catch {
                completion(.failure(RemoteRepositoryError.unsupportedJSONEncodingOrStructure))
                return
            }
        }
        
        guard let dataTask = task else {
            completion(.failure(RemoteRepositoryError.requestInvalid))
            return
        }
        
        dataTask.resume()
    }

}
