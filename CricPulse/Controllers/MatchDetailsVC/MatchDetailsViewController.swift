import UIKit

class MatchDetailsViewController: UIViewController {
    var fixtureId : Int?
    
    
    // MARK: ViewModel
    private let viewModel = MatchDetailsViewModel(remoteFixtureRepository: RemoteFixtureRepository())
    
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
    // Man of the match
    @IBOutlet weak var manOfTheMatchImage: UIImageView!
    @IBOutlet weak var manMatchName: UILabel!
    @IBOutlet weak var manMatchTeamFlag: UIImageView!
    
    
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
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let fixtureId = fixtureId else{
            print("Error: fixtureID is nil")
            return
        }
        Task{await viewModel.getFixture(id: fixtureId)}
        
        
        setupView()
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
        matchDate.isHidden = true
        scoreStack.isHidden = false
        
        winPercenTageStackView.isHidden = true
        manOfTheMatchStackView.isHidden = false
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
