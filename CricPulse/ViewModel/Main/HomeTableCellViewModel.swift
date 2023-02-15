import Foundation

import UIKit
class HomeTableCellViewModel{
    // identifier
    static var identifier: String {
        return Constants.homeTableCellReuseIdentifier
    }

    // nib register
    static func register() -> UINib {
        UINib(nibName: "HomeTVCell", bundle: nil)
    }
    
    // number of rows
    
}
