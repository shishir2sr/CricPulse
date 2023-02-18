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
    
    // MARK: Awake from Xib
    override func awakeFromNib() {
        super.awakeFromNib()
        homeTVCBackView.round(10)
        scoreCardBackView.round(5)
        textResultBackView.round(5)
        matchType.addBorder(color: .systemOrange, width: 0.5)
        matchType.round(5)
    }
    
    // Setup cells
    func setupCell(viewModel: FinishedMatchScoreCardTVModel){
        tournamentName.text = viewModel.tournamentName
        roundNumber.text = viewModel.matchNo
        matchDate.text = viewModel.startingDate.formatted(date: .abbreviated, time: .shortened)
        teamOneName.text = viewModel.localTeamName
        teamTwoName.text = viewModel.visitorTeamName
        matchType.text = viewModel.gameType
        teamOneScore.text = viewModel.localTeamScore
        teamTwoScore.text = viewModel.visitorTeamScore
        matchResult.text = viewModel.matchUpdateText
        teamOneFlag.sd_setImage(with: URL(string: viewModel.localTeamFlagUrl), placeholderImage: UIImage(systemName: "photo"))
        teamTwoFlag.sd_setImage(with: URL(string: viewModel.visitorTeamFlagUrl), placeholderImage: UIImage(systemName: "photo"))
        
    
    }
    
}
