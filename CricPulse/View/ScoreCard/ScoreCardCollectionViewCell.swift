import UIKit

class ScoreCardCollectionViewCell: UICollectionViewCell {
   
    // View Outlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var matchStatusView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var textualScoreView: UIView!
    
    // Label Outlets
    @IBOutlet weak var tournamentTitle: UILabel!
    @IBOutlet weak var matchNo: UILabel!
    @IBOutlet weak var matchStatusLabel: UILabel!  // Live or Upcoming or Completed
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var lTeamName: UILabel!
    @IBOutlet weak var vTeamName: UILabel!
    @IBOutlet weak var gameType: UILabel!
    @IBOutlet weak var lTeamScoreOne: UILabel!
    @IBOutlet weak var vTeamScoreOne: UILabel!
    @IBOutlet weak var textualScoreLabel: UILabel!
    
    //Image Outlets
    @IBOutlet weak var lTeamFlag: UIImageView!
    @IBOutlet weak var vTeamFlag: UIImageView!
    
    // Button Outlets
    @IBOutlet weak var notificationButtonOutlet: UIButton!
    
    // Stack Outlets
    @IBOutlet weak var scoreOneStack: UIStackView!
    
    // MARK: Awake From Xib
    override func awakeFromNib() {
        super.awakeFromNib()
        uiConfig()
    }
    // UI configuration
     func uiConfig() {
        backView.round(10)
        backView.addBorder(color: UIColor.systemGray6, width: 1)
        notificationButtonOutlet.round(5)
        scoreView.round(5)
        matchStatusView.round(5)
        textualScoreView.round(5)
        gameType.round(5)
        gameType.addBorder(color: .systemGreen, width: 1)
    }
    
    func setupCell(viewModel: ScoreBoardCollectionViewModel){
        tournamentTitle.text = viewModel.tournamentName
        matchNo.text = viewModel.matchNo
        matchStatusLabel.text = viewModel.matchStatus?.statusText
        stadiumName.text = viewModel.stadiumName
        lTeamName.text = viewModel.localTeamName
        vTeamName.text = viewModel.visitorTeamName
        gameType.text = viewModel.gameType
        lTeamScoreOne.text = viewModel.localTeamScore
        vTeamScoreOne.text = viewModel.visitorTeamScore
        textualScoreLabel.text = viewModel.matchUpdateText
        
        matchStatusView.backgroundColor = viewModel.getMatchStatusColor()
        
        notificationButtonOutlet.isHidden = true
        if viewModel.matchStatus == .ns{
            notificationButtonOutlet.isHidden = false
            notificationButtonOutlet.isUserInteractionEnabled = false
        }
        
        // TODO: Flag show using sdwebimage
        /**
        
         Image Outlets
         @IBOutlet weak var lTeamFlag: UIImageView!
         @IBOutlet weak var vTeamFlag: UIImageView!
         */
    }
}
