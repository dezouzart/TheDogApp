import UIKit

extension UIFont {
    static let helveticaNeueBold = UIFont.helveticaNeue(size: 18)
    static func helveticaNeue(size: CGFloat) -> UIFont? {
        UIFont(name: "HelveticaNeue-Bold", size: size)
    }
}
