import UIKit

class DetailedScoreTViewCell: UITableViewCell {
    // Outlets
    @IBOutlet weak var batterName: UILabel!
    @IBOutlet weak var batterPosition: UILabel!
    
    @IBOutlet weak var run: UILabel!
    @IBOutlet weak var ball: UILabel!
    @IBOutlet weak var fours: UILabel!
    @IBOutlet weak var sixes: UILabel!
    @IBOutlet weak var strikeRate: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
