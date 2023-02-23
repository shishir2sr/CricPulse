

import UIKit

class PlayerDetailsTVCell: UITableViewCell {
    // Views
    @IBOutlet weak var playerProfileBackView: UIView!
    
    //  Outlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var playerProfileImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
