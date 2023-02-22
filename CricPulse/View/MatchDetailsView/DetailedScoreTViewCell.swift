import UIKit

class DetailedScoreTViewCell: UITableViewCell {
    
    
    
    // Outlets
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playersPosition: UILabel!
    
    @IBOutlet weak var run: UILabel!
    @IBOutlet weak var ball: UILabel!
    @IBOutlet weak var fours: UILabel!
    @IBOutlet weak var sixes: UILabel!
    @IBOutlet weak var strikeRate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
