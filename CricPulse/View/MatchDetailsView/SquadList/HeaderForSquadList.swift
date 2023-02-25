
import UIKit

class HeaderForSquadList: UITableViewHeaderFooterView {
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(5)

    }
    
}
