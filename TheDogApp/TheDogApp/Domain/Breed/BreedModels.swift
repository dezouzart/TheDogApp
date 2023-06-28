import Foundation

// Models to supporting VIP Architecture
enum Breed {
    // Interactor
    struct Request {}
    
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
    struct ViewModel: Equatable {
        let breedViewModelList: [BreedViewModel]
        
        static func == (lhs: Breed.ViewModel, rhs: Breed.ViewModel) -> Bool {
            return lhs.breedViewModelList == rhs.breedViewModelList
        }
    }
    
    struct BreedViewModel: Equatable {
        let name: String
        let imageUrl: URL
        let breedGroup: String?
        let temperament: String?
        let origin: String?
        
        static func == (lhs: BreedViewModel, rhs: BreedViewModel) -> Bool {
            return lhs.name == rhs.name
        }
    }
}

// Models to supporting API comunication
extension Breed {
    struct DataRequest {
        let page: Int
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
