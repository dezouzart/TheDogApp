import Foundation

enum Breed {
    struct Request {
        let page: Int
    }
    
    struct Response {}
    
    struct ViewModel {}
    
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
