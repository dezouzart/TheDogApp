enum RemoteRepositoryError: Swift.Error {
    case internalError
    case invalidURL
    case emptyResponseData
    case unsupportedJSONEncoding
    case unsupportedJSONStructure
    case httpError
    case unableToRetrieveData
}
