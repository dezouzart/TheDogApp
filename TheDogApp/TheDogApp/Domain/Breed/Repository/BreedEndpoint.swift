import Foundation

enum BreedEndpoints {
    case breedList(page: Int)
}

extension BreedEndpoints {
    private var domain: String { "https://api.thedogapi.com/" }
    private var path: String { "v1/breeds" }
    
    private var queryString: String {
        switch self {
        case .breedList(let page):
            return "?order=ASC&limit=24&page=\(page)"
        }
    }

    private var url: URL? { URL(string: domain + path + queryString) }
    
    var request: URLRequest? {
        guard let url = self.url else { return nil }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(Credentials.apiKey, forHTTPHeaderField: "x-api-key")
        
        return request
    }
}

fileprivate struct Credentials {
    static let apiKey = "live_8O4RtTZi8oBWBAtNs67vqs3kt7DG638LHRKzYziwyNpiMYnJr38iR8h8VNAdWuB3"
}
