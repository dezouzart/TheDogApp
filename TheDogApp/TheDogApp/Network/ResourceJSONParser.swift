import Foundation

protocol JSONParserLogic {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

class ResourceJSONParser: JSONParserLogic {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        let decoder = JSONDecoder()
        let structure = try decoder.decode(type, from: data)
        return structure
    }
}
