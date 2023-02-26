import UIKit
import Combine
import SDWebImage

class MatchDetailsViewController: UIViewController {
    var fixtureId : Int?
    var timer: Timer?
    let notificationCenter = UNUserNotificationCenter.current()
    
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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
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
    
    
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
    }
    
    
    // View Did load configuration
    func configViewDidLoad(){
        setupView()
        setupBinders()
        guard let fixtureId = fixtureId else{ return }
        Task{await viewModel.getFixture(id: fixtureId)}
    }
    
    func setupBinders(){
        viewModel.$matchDetailsData.sink {[weak self] matchDetailsData in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.matchDetailsData = matchDetailsData
                self.dataSetup()
            }
        }.store(in: &cancellables)
        
        viewModel.$isLoading.sink {[weak self] isLoading in
            guard let self  = self else {return}
            DispatchQueue.main.async {
                if isLoading{
                    self.loadingIndicator.startAnimating()
                }else{
                    self.loadingIndicator.stopAnimating()
                }
            }
        }.store(in: &cancellables)
        
        viewModel.$errorHandler.sink {[weak self] err in
            guard let self = self else {return}
            guard let err = err else{return}
            
            let errorPopup = ErrorPopupBuilder()
                .setTitle("Error!")
                .setMessage(err.localizedDescription)
                .addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                    Task{guard let fixtureId = self.fixtureId else{return}
                        await self.viewModel.getFixture(id: fixtureId)}}))
                .build()
            DispatchQueue.main.async {
                errorPopup?.show()
            }
            
            
        }.store(in: &cancellables)
    }
    
    
    
    // MARK: - Alert control
    @IBAction func alertActionButton(_ sender: UIButton) {
        notificationCenter.getNotificationSettings { (settings) in
            
            DispatchQueue.main.async
            { [weak self] in
                guard let self = self else {return}
                
                let teamOneName = self.matchDetailsData?.teamOneName ?? "Team One"
                let teamTwoName = self.matchDetailsData?.teamTwoName ?? "Team Two"
                
                let title = (self.matchDetailsData?.teamOneCode ?? "Team 1") + "vs" + (self.matchDetailsData?.teamTwoCode ?? "Team 2")
                let message = "The cricket match between \(teamOneName) and \(teamTwoName) is about to begin! Get ready for some thrilling action"
                
                let date = self.matchDetailsData?.matchDate
                
                if(settings.authorizationStatus == .authorized)
                {
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.body = message
                    let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date ?? Date().addingTimeInterval(60*15*(-1)))
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    
                    self.notificationCenter.add(request) { (error) in
                        if(error != nil)
                        {
                            print("Error " + error.debugDescription)
                            return
                        }
                    }
                    
                    let ac = UIAlertController(title: "Notification Scheduled", message: "Before 15 minutes of the game being start", preferredStyle: .alert)
                    
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in}))
                    self.present(ac, animated: true)
                    
                    if let fixtureId = self.fixtureId{
                        UserDefaults.standard.set(true, forKey: "\(fixtureId)")
                        self.alertButtonOutlet.imageView?.image = UIImage(systemName: "bell.slash.circle")
                        self.alertButtonOutlet.backgroundColor = .darkGray
                    }
                }
                else
                
                {
                    self.grantPermission(self)
                }
            }
        }
    }
    
    fileprivate func grantPermission(_ self: MatchDetailsViewController) {
        let ac = UIAlertController(title: "Enable Notifications?", message: "To use this feature you must enable notifications in settings", preferredStyle: .alert)
        
        let goToSettings = UIAlertAction(title: "Settings", style: .default)
        { (_) in
            guard let setttingsURL = URL(string: UIApplication.openSettingsURLString)
            else{return}
            
            if(UIApplication.shared.canOpenURL(setttingsURL))
            {
                UIApplication.shared.open(setttingsURL) { (_) in}
            }
        }
        ac.addAction(goToSettings)
        ac.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in}))
        self.present(ac, animated: true)
    }
    
    
    func formattedDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y HH:mm"
        return formatter.string(from: date)
    }
    
    
    // MARK: - Match Details Data Setup
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
    
}



// MARK: - MatchDetailsView Extension
extension MatchDetailsViewController{
    // View Setup
    fileprivate func setupView() {
        backView.round(10)
        backView.addShadow(opecity: 0.6, size: 1, radius: 1, color: UIColor.gray)
        backView.layer.masksToBounds = false
        matchType.addBorder(color: .systemGreen, width: 1)
        matchType.round(5)
        matchStatusView.round(5)
        noteView.round(5)
        scoreView.round(5)
        
        containerViewOne.isHidden = false
        containerViewTwo.isHidden = true
        containerViewThree.isHidden = true
        
        if let fixtureId = fixtureId {
            let alertEnabled = UserDefaults.standard.bool(forKey: "\(fixtureId)")
            if alertEnabled{
                alertButtonOutlet.imageView?.image = UIImage(systemName: "bell.slash.circle")
                self.alertButtonOutlet.round(4)
            }else{
                self.alertButtonOutlet.round(4)
            }
        }
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
