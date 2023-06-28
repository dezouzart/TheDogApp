import Foundation

extension Labels {
    enum Breed {
        static let name = "Name: "
        static let group = "Group: "
        static let temperament = "Temperament: "
        static let origin = "Origin: "
        
        enum Scenes {
            enum Listing {
                static let title = "Breed List"
            }
            
            enum Detail {
                static let title = "Breed Detail"
            }
            
            enum Search {
                static let title = "Search"
            }
        }
        
        enum Erros {
            static let title = "Ops"
            static let fetchMessage = "Could not load breeds from server"
            static let notProvided = "Not provided"
        }
    }
}
