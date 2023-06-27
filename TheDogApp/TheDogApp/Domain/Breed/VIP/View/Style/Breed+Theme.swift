import UIKit

extension Themes {
    enum Breed {
        enum Listing {
            enum Cell {}
        }
        enum Detail {}
    }
}

extension Themes.Breed.Listing {
    static let backgroundColor = UIColor.black
    
    enum Spinner {
        static let color = UIColor.seashell
        static let style = UIActivityIndicatorView.Style.medium
    }
    
    enum CollectionView {
        static let backgroundColor = UIColor.clear
    }
}

extension Themes.Breed.Listing.Cell {
    static let cornerRadius = 20.0
    static let backgroundColor = UIColor.black
    
    enum Label {
        static let textColor = UIColor.seashell
        static let textAlignment = NSTextAlignment.center
        static let font = UIFont.helveticaNeue(size: 12)
    }
    
    enum Image {
        static let cornerRadius = 20.0
        static let borderColor = UIColor.seashell
        static let borderWidth = 0.0
        static let selectedBorderWidth = 4.0
    }
}

extension Themes.Breed.Detail {
    
}
