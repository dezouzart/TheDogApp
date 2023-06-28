import Foundation

class BreedProvider: BreedRepository {
    typealias BreedCompletion = (Result<Breed.DataList, Error>) -> Void
    
    private let session: RemoteSession
    private let jsonParser: JSONParserLogic
    
    init(session: RemoteSession = SystemRemoteSession(),
         jsonParser: JSONParserLogic = ResourceJSONParser()) {
        self.session = session
        self.jsonParser = jsonParser
    }
    
    func fetchBreeds(dataRequest: Breed.DataRequest, completion: @escaping BreedCompletion) {
        DispatchQueue.global().async { [weak self] in
            guard let request = BreedEndpoints.breedList(page: dataRequest.page).request else {
                completion(.failure(RemoteRepositoryError.requestInvalid))
                return
            }
            
            guard let context = self else {
                completion(.failure(RemoteRepositoryError.unableToRetrieveData))
                return
            }
            
            guard let dataTask = context.createTask(request: request, completion: completion) else {
                completion(.failure(RemoteRepositoryError.requestInvalid))
                return
            }
            
            dataTask.resume()
        }
    }
    
    private func createTask(request: URLRequest, completion: @escaping BreedCompletion) -> RemoteSessionDataTask? {
        return session.dataTask(request: request) { [weak self] (data, response, error) in
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
            
            context.parse(data, with: completion)
        }
    }
    
    private func parse(_ data: Data, with completion: @escaping BreedCompletion) {
        do {
            let breedDataResponse = try self.jsonParser.decode(
                [Breed.Data].self,
                from: data
            )
            completion(.success(Breed.DataList(breedDataList: breedDataResponse)))
            return
        } catch {
            completion(.failure(RemoteRepositoryError.unsupportedJSONEncodingOrStructure))
            return
        }
    }
}
