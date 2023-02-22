
import UIKit
import SDWebImage
import Combine
class ScoreBoardViewController: UIViewController {
    
    var matchDetailsViewModel = MatchDetailsViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    var matchDetailsVM: MatchDetailsData?
    
    // UIView outlets
    @IBOutlet weak var teamOneBackgroundVIew: UIView!
    @IBOutlet weak var teamTwoBackgroundVIew: UIView!
    
    // Outlets
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamOneFlag: UIImageView!
    
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    @IBOutlet weak var teamTwoFlag: UIImageView!
    
    
    // MARK: - View Did load?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBinder()
    }
    
    func setupBinder(){
        matchDetailsViewModel.$matchDetailsData.sink { matchDetails in
            DispatchQueue.main.async {
                if let matchDetails = matchDetails{
                    self.matchDetailsVM = matchDetails
                    self.setupData()
                }
               
            }
        }.store(in: &cancellables)
    }
    
    
    func setupData(){
        self.teamOneName.text = matchDetailsVM?.teamOneName
        self.teamOneFlag.sd_setImage(with: URL(string: matchDetailsVM?.teamOneFlagUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
        let tOneScore = "\(matchDetailsVM?.teamOneScore?.score ?? 0)"
        self.teamOneScore.text = tOneScore
        
        self.teamTwoName.text = matchDetailsVM?.teamTwoName
        self.teamTwoFlag.sd_setImage(with: URL(string: matchDetailsVM?.teamTwoFlagUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
        let tTwoScore = "\(matchDetailsVM?.teamTwoScore?.score ?? 0)"
        self.teamTwoScore.text = tTwoScore
    }
    
    /**
     self.teamOneName.text = matchDetails?.teamOneName
     self.teamOneFlag.sd_setImage(with: URL(string: matchDetails?.teamOneFlagUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
     let tOneScore = "\(matchDetails?.teamOneScore?.score ?? 0)"
     self.teamOneScore.text = tOneScore
     
     self.teamTwoName.text = matchDetails?.teamTwoName
     self.teamTwoFlag.sd_setImage(with: URL(string: matchDetails?.teamTwoFlagUrl ?? ""), placeholderImage: UIImage(systemName: "photo"))
     let tTwoScore = "\(matchDetails?.teamTwoScore?.score ?? 0)"
     self.teamTwoScore.text = tTwoScore
     */
    
    // MARK:
     func setupView() {
        teamOneBackgroundVIew.addBorder(color: .systemGray4, width: 1)
        teamOneBackgroundVIew.round(10)
        teamOneBackgroundVIew.addShadow(opecity: 0.8, size: 2, radius: 4, color: UIColor.darkGray)
        
        teamTwoBackgroundVIew.addBorder(color: .systemGray4, width: 1)
        teamTwoBackgroundVIew.round(10)
        
        let tapGestureTwo = UITapGestureRecognizer(target: self, action: #selector(viewTwoTapped))
        teamTwoBackgroundVIew.addGestureRecognizer(tapGestureTwo)
        
        let tapGestureOne = UITapGestureRecognizer(target: self, action: #selector(viewOneTapped))
        teamOneBackgroundVIew.addGestureRecognizer(tapGestureOne)
    }
    
    // View One tapped
    @objc func viewOneTapped(){
        buttonGuestureAnimation(for: teamOneBackgroundVIew)
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.detailedScoreBoardForTeamID)  as? DetailedScoreViewController
        viewController?.title = ""
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    // Team two button tap
    @objc func viewTwoTapped(){
        print("button 2 pressed")
        buttonGuestureAnimation(for: teamTwoBackgroundVIew)
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.detailedScoreBoardForTeamID)  as? DetailedScoreViewController
        viewController?.title = ""
        navigationController?.pushViewController(viewController!, animated: true)
    }

//     Animation
    fileprivate func buttonGuestureAnimation(for button: UIView) {
        UIView.animate(withDuration: 0.1, animations: {
            button.backgroundColor = UIColor.systemGray5
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                button.backgroundColor = UIColor.white
            })
        })
    }
}
