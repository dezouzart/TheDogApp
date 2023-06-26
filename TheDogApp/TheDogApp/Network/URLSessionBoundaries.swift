import Foundation

protocol RemoteSession {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RemoteSessionDataTask
}

class SystemRemoteSession: RemoteSession {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RemoteSessionDataTask {
        let session = URLSession(configuration: .default)
        return session.dataTask(with: url, completionHandler: completionHandler) as RemoteSessionDataTask
    }
}

protocol RemoteSessionDataTask {
    func resume()
}

extension URLSessionDataTask: RemoteSessionDataTask {}
