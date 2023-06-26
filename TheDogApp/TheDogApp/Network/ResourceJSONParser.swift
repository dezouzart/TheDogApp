import Foundation

protocol JSONParserLogic {
    func parse(from data: Data) -> [String: AnyObject]?
}

class ResourceJSONParser: JSONParserLogic {
    func parse(from data: Data) -> [String: AnyObject]? {
        return try? JSONSerialization.jsonObject(with: data) as? [String: AnyObject]
    }
}
