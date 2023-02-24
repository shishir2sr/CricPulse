import Foundation
import UIKit
class PlayerDetailsViewModel{
    
    // MARK: - TableView Logics
    /// Decides tableviews number of rows
    func numberOfRows(in section: Int )-> Int{
        5
    }
    
    /// Decides number of sections in tableview
    func numberOfSection()-> Int{
        return 2
    }
    
    /// xib registration
    func registerNib()-> UINib{
        return UINib(nibName: Constants.playerDetailsTVCell, bundle: nil)
    }
}
