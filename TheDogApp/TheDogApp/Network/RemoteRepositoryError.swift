enum RemoteRepositoryError: Swift.Error {
    case internalError
    case requestInvalid
    case emptyResponseData
    case unsupportedJSONEncodingOrStructure
    case httpError
    case unableToRetrieveData
}
