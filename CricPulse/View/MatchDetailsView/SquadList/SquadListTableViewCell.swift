
import UIKit
class SquadListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playersName: UILabel!
    @IBOutlet weak var backView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(5)
        backView.addShadow(opecity: 1, size: 2, radius: 4, color: UIColor.gray)
    }

}
