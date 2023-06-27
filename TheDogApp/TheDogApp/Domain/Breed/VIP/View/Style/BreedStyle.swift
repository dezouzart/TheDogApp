import UIKit

struct BreedListingStyle {
    let backgroundColor = Themes.Breed.Listing.backgroundColor
    let spinnerColor = Themes.Breed.Listing.Spinner.color
    let spinnerStyle = Themes.Breed.Listing.Spinner.style
    let collectionViewColor = Themes.Breed.Listing.CollectionView.backgroundColor
    
    func getLayout(_ viewWidth: CGFloat) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let inset: CGFloat = 20.0
        let itemsPerRow: CGFloat = 2
        let paddingSpace = inset * (itemsPerRow + 1)
        let availableWidth = viewWidth - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        layout.sectionInset = UIEdgeInsets(top: 20.0, left: inset, bottom: 160.0, right: inset)
        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem + 40)
        
        return layout
    }
}

struct BreedCellStyle {
    let cornerRadius = Themes.Breed.Listing.Cell.cornerRadius
    let backgroundColor = Themes.Breed.Listing.Cell.backgroundColor
    let spinnerColor = Themes.Breed.Listing.Spinner.color
    let spinnerStyle = Themes.Breed.Listing.Spinner.style
    
    let labelTextColor = Themes.Breed.Listing.Cell.Label.textColor
    let labelTextAlignment = Themes.Breed.Listing.Cell.Label.textAlignment
    let labelFont = Themes.Breed.Listing.Cell.Label.font
    
    let imageCornerRadius = Themes.Breed.Listing.Cell.Image.cornerRadius
    let imageBorderColor = Themes.Breed.Listing.Cell.Image.borderColor
    let imageBorderWidth = Themes.Breed.Listing.Cell.Image.borderWidth
    let imageSelectedBorderWidth = Themes.Breed.Listing.Cell.Image.selectedBorderWidth
}

struct BreedDetailStyle {
    let backgroundColor = Themes.Breed.Detail.backgroundColor
}
