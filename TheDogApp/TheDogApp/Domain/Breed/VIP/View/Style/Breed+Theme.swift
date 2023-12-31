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
    static let backgroundColor = UIColor.black
    static let topInset = 40.0
    static let verticalSpacing = 20.0
    
    enum Label {
        static let textColor = UIColor.seashell
        static let textAlignment = NSTextAlignment.center
        static let font = UIFont.helveticaNeue(size: 12)
        static let numberOfLines = 2
        static let height = 32.0
        static let leading = 16.0
        static let trailing = -16.0
    }
    
    enum Image {
        static let cornerRadius = 20.0
        static let size = 240.0
    }
}
