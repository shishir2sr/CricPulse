import UIKit
import SDWebImage
class SearchPlayerTVCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(10)
        playerImage.round(30)
        backView.addShadow(opecity: 0.6, size: 1, radius: 2, color: UIColor.gray)
        playerImage.addBorder(color: UIColor.systemGray3, width: 3)
    }
    
    /// Populate tableview cell
    func setupCell(player: CDPlayer){
        playerImage.sd_setImage(with: URL(string: player.image_path ?? ""), placeholderImage: UIImage(systemName: "photo"))
        playerName.text = player.name
    }
    
}
