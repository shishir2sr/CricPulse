

import UIKit

class HomeTableViewCell: UITableViewCell {
    // View Outlets
    @IBOutlet weak var homeTVCBackView: UIView!
    @IBOutlet weak var scoreCardBackView: UIView!
    @IBOutlet weak var textResultBackView: UIView!
    // label outlets
    @IBOutlet weak var tournamentName: UILabel!
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var matchType: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    @IBOutlet weak var matchResult: UILabel!
    // ImageView outlets
    @IBOutlet weak var teamOneFlag: UIImageView!
    @IBOutlet weak var teamTwoFlag: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        homeTVCBackView.round(10)
        scoreCardBackView.round(5)
        textResultBackView.round(5)
        matchType.addBorder(color: .systemGreen, width: 0.5)
    }
}
