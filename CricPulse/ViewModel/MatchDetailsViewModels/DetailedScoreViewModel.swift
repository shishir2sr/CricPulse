
import Foundation
import UIKit

class DetailedScoreViewModel{
    // identifier
    static var identifier: String {
        return Constants.detailedScoreViewXibID
    }
    
    // Register Xib file
    static func registerCellsXib() -> UINib {
        UINib(nibName: Constants.detailedScoreViewXibName, bundle: nil)
    }
    
    //
    static func registerBattersHeaderXib() -> UINib {
        UINib(nibName: "HeaderForBattersCell", bundle: nil)
    }
    static func registerBattersFooterXib()->UINib{
        UINib(nibName: "FooterForBattersCell", bundle: nil)
    }
}
