import Foundation

@testable import TheDogApp

class RemoteSessionMock: RemoteSession {
    var dataToReturn: Data? = nil
    var responseToReturn: URLResponse? = nil
    var errorToReturn: Error? = nil
    
    func dataTask(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> RemoteSessionDataTask? {
        completionHandler(dataToReturn, responseToReturn, errorToReturn)
        return RemoteSessionDataTaskMock()
    }
}

class RemoteSessionDataTaskMock: RemoteSessionDataTask {
    func resume() {}
}
