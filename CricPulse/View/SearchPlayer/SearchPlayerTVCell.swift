import UIKit
import SDWebImage
class SearchPlayerTVCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(5)
        playerImage.round(30)
        backView.addShadow(opecity: 0.1, size: 0.5, radius: 1, color: UIColor.gray)
        playerImage.addBorder(color: UIColor.systemGray3, width: 3)
    }
    
    /// Populate tableview cell
    func setupCell(player: CDPlayer){
        playerImage.sd_setImage(with: URL(string: player.image_path ?? ""), placeholderImage: UIImage(systemName: "photo"))
        playerName.text = player.name
    }
    
}
