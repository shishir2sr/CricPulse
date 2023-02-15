import Foundation
import UIKit

class ScoreBoardCollectionViewModel{
    // identifier
    static var identifier: String {
        return Constants.scoreCardIdentifier
    }

    // nib register
    static func register() -> UINib {
        UINib(nibName: Constants.scoreCardXibName, bundle: nil)
    }
}
