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
    func addShadow(opecity: Float, size: Double, radius: Double, color: UIColor ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opecity
        layer.shadowOffset = CGSize(width: size, height: size)
        layer.shadowRadius = radius
        layer.masksToBounds = true
    }
    
    
}


