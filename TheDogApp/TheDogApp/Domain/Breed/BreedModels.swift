import Foundation

enum Breed {
    struct Request {
        let page: Int
    }
    
    struct Response {
        let breedList: [BreedModel]
    }
    
    struct ViewModel {
        let breedViewModelList: [BreedViewModel]
    }
    
    struct BreedViewModel {
        let name: String
        let imageUrl: URL
    }
    
    struct BreedModel {
        let name: String
        let imageUrl: URL
        let breedGroup: String
        let temperament: String
        let origin: String
    }
    
    struct DataList {
        let breedDataList: [Breed.Data]
    }
    
    struct Data: Codable {
        let id: Int?
        let name: String?
        let breedGroup: String?
        let temperament: String?
        let origin: String?
        let image: DataImage?
        
        private enum CodingKeys : String, CodingKey {
            case id, name, breedGroup = "breed_group", temperament, origin, image
        }
    }

    struct DataImage: Codable {
        let id: String?
        let width: Int?
        let height: Int?
        let url: String?
    }
}
