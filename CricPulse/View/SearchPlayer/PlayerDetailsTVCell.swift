

import UIKit

class PlayerDetailsTVCell: UITableViewCell {
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var t20: UILabel!
    @IBOutlet weak var t20i: UILabel!
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var odi: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(indexpath: IndexPath, stats: PlayerStats){
        if indexpath.section == 0{
            format.text = "\(stats.t20Stats?.batting?.average)"
        }
    }
   
}
