import Foundation

extension Labels {
    enum Breed {
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
        }
    }
}
