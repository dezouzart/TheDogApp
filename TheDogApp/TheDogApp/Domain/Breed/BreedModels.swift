import Foundation

// Models to supporting VIP Architecture
enum Breed {
    // Interactor
    struct Request {
        let page: Int
    }
    
    // Presenter
    struct Response {
        let breedList: [BreedModel]
    }
    
    struct BreedModel {
        let name: String
        let imageUrl: URL
        let breedGroup: String?
        let temperament: String?
        let origin: String?
    }
    
    // View
    struct ViewModel {
        let breedViewModelList: [BreedViewModel]
    }
    
    struct BreedViewModel {
        let name: String
        let imageUrl: URL
    }
}

// Models to supporting API comunication
extension Breed {
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
