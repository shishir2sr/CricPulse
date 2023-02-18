import UIKit

class MatchDetailsViewController: UIViewController {
    // MARK: - Outlets
    // View Outlets
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var matchStatusView: UIView!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var scoreView: UIView!
    
    // Label outlets
    @IBOutlet weak var tournamentName: UILabel!
    @IBOutlet weak var matchNumber: UILabel!
    @IBOutlet weak var matchStatus: UILabel!
    @IBOutlet weak var alertButtonOutlet: UIButton!
    
    @IBOutlet weak var teamOneFlag: UIImageView!
    @IBOutlet weak var teamOneCode: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamOneWInPercentage: UILabel!
    
    @IBOutlet weak var teamTwoFlag: UIImageView!
    @IBOutlet weak var teamTwoCode: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    @IBOutlet weak var teamTwoWinPercentage: UILabel!
    
    @IBOutlet weak var matchType: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var winProgress: UIProgressView!
    
    // Stack Outlets
    @IBOutlet weak var scoreStack: UIStackView!
    @IBOutlet weak var winPercenTageStackView: UIStackView!
    // Segment Controller
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.round(10)
        matchType.addBorder(color: .systemGreen, width: 1)
        matchType.round(5)
        matchStatusView.round(5)
        noteView.round(5)
        scoreView.round(5)
    }
}
