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
        backView.addShadow(opecity: 0.8, size: 2, radius: 4, color: UIColor.darkGray)
        playerImage.addBorder(color: UIColor.gray, width: 3)
    }
    
    /// Populate tableview cell
    func setupCell(player: CDPlayer){
        playerImage.sd_setImage(with: URL(string: player.image_path ?? ""), placeholderImage: UIImage(systemName: "photo"))
        playerName.text = player.name
    }
    
}
