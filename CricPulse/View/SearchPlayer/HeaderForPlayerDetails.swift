import UIKit

class HeaderForPlayerDetails: UITableViewHeaderFooterView {
    
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(10)
    }
}
