

import UIKit

class MatchInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var matchInfoStack: UIView!
    
    @IBOutlet weak var matchNo: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    @IBOutlet weak var matchType: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var capacity: UILabel!
    
    @IBOutlet weak var venueGuideBackView: UIView!
    @IBOutlet weak var venueGuideView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        matchInfoStack.round(10)
        matchInfoStack.addBorder(color: UIColor.systemGray3, width: 0.5)
        matchInfoStack.addShadow(opecity: 0.8, size: 1, radius: 2, color: UIColor.gray)
        matchInfoStack.layer.masksToBounds = true
        venueGuideBackView.round(10)
        venueGuideBackView.addBorder(color: UIColor.systemGray3, width: 0.5)
        venueGuideBackView.addShadow(opecity: 0.8, size: 1, radius: 2, color: UIColor.gray)
        venueGuideBackView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
