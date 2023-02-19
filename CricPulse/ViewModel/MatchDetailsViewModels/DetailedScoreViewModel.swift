
import Foundation
import UIKit

class DetailedScoreViewModel{
    // identifier
    static var identifier: String {
        return Constants.detailedScoreViewXibID
    }
    
    // Register Xib file
    static func register() -> UINib {
        UINib(nibName: Constants.detailedScoreViewXibName, bundle: nil)
    }
    
}
