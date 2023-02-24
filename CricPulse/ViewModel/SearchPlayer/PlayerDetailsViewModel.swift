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
    func registerCellXib()-> UINib{
        return UINib(nibName: Constants.playerDetailsTVCell, bundle: nil)
    }
    
    /// xib registration
    func registerHeaderXib()-> UINib{
        return UINib(nibName: Constants.headerForPlayerDetails, bundle: nil)
    }
}
