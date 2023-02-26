
import Foundation
import UIKit

class DetailedScoreViewModel{
    // number of items
    func numberOfRows(in section: Int) -> Int {
        if section == 0{
            return 5
        }else{
            return 3
        }
    }
}


// MARK: - TableView options
extension DetailedScoreViewModel {
    // identifier
    static var cellIdentifier: String {
        return Constants.detailedScoreViewXibID
    }
    // Register Xib file
    static func registerCellsXib() -> UINib {
        UINib(nibName: Constants.detailedScoreViewXibName, bundle: nil)
    }
    
    // Header for batter
    static func registerBattersHeaderXib() -> UINib {
        UINib(nibName: "HeaderForBattersCell", bundle: nil)
    }
    // Batters footer
    static func registerBattersFooterXib()->UINib{
        UINib(nibName: "FooterForBattersCell", bundle: nil)
    }
}
