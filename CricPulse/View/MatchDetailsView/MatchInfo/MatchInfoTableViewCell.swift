

import UIKit

class MatchInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var matchNo: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    @IBOutlet weak var matchType: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var matchTime: UILabel!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var capacity: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
