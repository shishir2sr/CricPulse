import UIKit
class SearchPlayerTVCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(10)
        playerImage.round(30)
        backView.addShadow(opecity: 0.8, size: 2, radius: 4, color: UIColor.darkGray)
    }
    
}
