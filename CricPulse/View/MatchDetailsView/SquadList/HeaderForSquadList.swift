
import UIKit

class HeaderForSquadList: UITableViewHeaderFooterView {
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
            super.awakeFromNib()
            
//            backView.layer.cornerRadius = 8 // Set a desired corner radius value
//            backView.layer.masksToBounds = true // Clip the subviews to the rounded corners
//
//
        backView.round(15)
        
        }
    
}
