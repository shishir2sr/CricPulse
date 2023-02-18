import UIKit
import Combine
import SDWebImage

class ScoreCardCollectionViewCell: UICollectionViewCell {
    private var cancellables = Set<AnyCancellable>()
    var timer: Timer?
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
    @IBOutlet weak var upcomingMatchDate: UILabel!
    
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
    
    // MARK: Prepare for reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        timer?.invalidate()
        timer = nil
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
    
    
    
    func setupCell(viewModel: ScoreCardCVModel){
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
        lTeamFlag.sd_setImage(with: URL(string: viewModel.localTeamFlagUrl), placeholderImage: UIImage(systemName: "photo"))
        vTeamFlag.sd_setImage(with: URL(string: viewModel.visitorTeamFlagUrl), placeholderImage: UIImage(systemName: "photo"))
        upcomingMatchDate.isHidden = true
        
        upcomingMatchSetup(viewModel)
    }
    
    // Upcoming match setup
    fileprivate func upcomingMatchSetup(_ viewModel: ScoreCardCVModel) {
        if viewModel.matchStatus == .ns{
            notificationButtonOutlet.isHidden = false
            notificationButtonOutlet.isUserInteractionEnabled = false
            scoreOneStack.isHidden = true
            upcomingMatchDate.isHidden = false
            upcomingMatchDate.text = viewModel.startingDate.formatted(date: .complete, time: .shortened)
        
            textualScoreLabel.text = viewModel.remainingTime()
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                guard let self = self  else {return}
                DispatchQueue.main.async {
                    self.textualScoreLabel.text = viewModel.remainingTime()
                }
            }
        }
    }
    
}

