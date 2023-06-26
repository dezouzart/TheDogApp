import Foundation

protocol RemoteSession {
    func dataTask(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RemoteSessionDataTask?
}

class SystemRemoteSession: RemoteSession {
    func dataTask(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RemoteSessionDataTask? {
        guard let url = request.url else {
            return nil
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = request.allHTTPHeaderFields
            
        let session = URLSession(configuration: configuration)
            
        return session.dataTask(with: url, completionHandler: completionHandler) as RemoteSessionDataTask
    }
}

protocol RemoteSessionDataTask {
    func resume()
}

extension URLSessionDataTask: RemoteSessionDataTask {}
