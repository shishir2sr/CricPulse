import UIKit
import Combine
import SDWebImage

class MatchDetailsViewController: UIViewController {
    var fixtureId : Int?
    var timer: Timer?
    
    // MARK: ViewModel
    let viewModel = MatchDetailsViewModel.shared
    var matchDetailsData: MatchDetailsData?
    private var cancellables = Set<AnyCancellable>()
    
   
    
    // MARK: - Outlets
    // View Outlets
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var matchStatusView: UIView!
    @IBOutlet weak var noteView: UIView!
    @IBOutlet weak var scoreView: UIView!
    
    // Label outlets
    @IBOutlet weak var stadiumName: UILabel!
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
    // Man of the match
    @IBOutlet weak var manOfTheMatchImage: UIImageView!
    @IBOutlet weak var manMatchName: UILabel!
    
    
    
    // Stack Outlets
    @IBOutlet weak var scoreStack: UIStackView!
    @IBOutlet weak var winPercenTageStackView: UIStackView!
    @IBOutlet weak var manOfTheMatchStackView: UIStackView!
    
    // Segment Controller
    @IBOutlet weak var segmentController: UISegmentedControl!
    // containerviews
    @IBOutlet weak var containerViewOne: UIView!
    @IBOutlet weak var containerViewTwo: UIView!
    @IBOutlet weak var containerViewThree: UIView!
    
    func dataSetup(){
        tournamentName.text = matchDetailsData?.tournamentName
        matchNumber.text = matchDetailsData?.matchNo
        matchStatus.text = matchDetailsData?.matchStatus?.statusText
        
        teamOneFlag.sd_setImage(with: URL(string: matchDetailsData?.teamOneFlagUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
       
        teamOneCode.text = matchDetailsData?.teamOneCode
        teamOneScore.text = viewModel.getTeamOneScore()
        teamOneWInPercentage.text = matchDetailsData?.teamOneWinPercentage
        
        
        teamTwoFlag.sd_setImage(with: URL(string: matchDetailsData?.teamTwoFlagUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
       
        teamTwoCode.text = matchDetailsData?.teamTwoCode
        teamTwoScore.text = viewModel.getTeamTwoScore()
        teamTwoWinPercentage.text = matchDetailsData?.teamTwoWinPercentage
        
        matchType.text = matchDetailsData?.matchType
        matchDate.text = matchDetailsData?.matchDate?.formatted(date: .abbreviated, time: .shortened)
        manOfTheMatchImage.sd_setImage(with: URL(string: matchDetailsData?.mOMImageUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
        manMatchName.text = matchDetailsData?.mOMName
        
        stadiumName.text = viewModel.getStadiumInfo()
        matchStatusView.backgroundColor = viewModel.getMatchStatusColor()
        note.text = matchDetailsData?.matchNote
        setupScoreViews()
        
    }
    
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
    }
    
    
    // View Did load configuration
    func configViewDidLoad(){
        // Ui changer
        setupView()
        
        // Get data
        guard let fixtureId = fixtureId else{ return }
        Task{
            await viewModel.getFixture(id: fixtureId)
        }
        // Binder Setup
        setupBinders()
    }
    
    // binder
    func setupBinders(){
        viewModel.$matchDetailsData.sink {[weak self] matchDetailsData in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.matchDetailsData = matchDetailsData
                self.dataSetup()
            }
        }.store(in: &cancellables)
    }
    
}


// MARK: - MatchDetailsView Extension
extension MatchDetailsViewController{
    // View Setup
    fileprivate func setupView() {
        backView.round(10)
        backView.addShadow(opecity: 0.6, size: 1, radius: 1, color: UIColor.gray)
        matchType.addBorder(color: .systemGreen, width: 1)
        matchType.round(5)
        matchStatusView.round(5)
        noteView.round(5)
        scoreView.round(5)
        
        containerViewOne.isHidden = false
        containerViewTwo.isHidden = true
        containerViewThree.isHidden = true
    }
    
    // MARK: Segment control
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if index == 0{
        debugPrint("Info Page")
            containerViewOne.isHidden = false
            containerViewTwo.isHidden = true
            containerViewThree.isHidden = true
        }else if index == 1{
            containerViewOne.isHidden = true
            containerViewTwo.isHidden = false
            containerViewThree.isHidden = true
        }else{
           debugPrint("Squad Page")
            containerViewOne.isHidden = true
            containerViewTwo.isHidden = true
            containerViewThree.isHidden = false
        }
    }
    
}
