
import Foundation
import UIKit

class SearchPlayerViewModel{
    // Decides tableviews number of rows
    func numberOfRows(in section: Int )-> Int{
        return 5
    }
    
    // Decides number of sections in tableview
    func numberOfSection()-> Int{
        return 0
    }
    
    // xib registration
    func registerNib()-> UINib{
        return UINib(nibName: Constants.searchPlayerTVCell, bundle: nil)
    }
}
