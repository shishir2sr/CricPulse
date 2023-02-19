import Foundation
import UIKit

extension UIView {
    /// Cornerradius
    func round(_ radious: CGFloat = 10) {
        layer.cornerRadius = radious
        clipsToBounds = true
    }
    
    /// Add border to uiviews
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    /// Add shadows to uiviews
    func addShadow(opacity: Float, offset: Double, radius: Double) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: 0, height: offset)
        layer.shadowRadius = CGFloat(radius)
    }
    
    
}


