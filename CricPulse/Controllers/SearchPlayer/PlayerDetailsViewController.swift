import UIKit
import Combine
import SDWebImage

class PlayerDetailsViewController: UIViewController {
    // Variables
    var playerId:Int? = nil
    private var cancellables = Set<AnyCancellable>()
    var playersStat: PlayerStats? = nil
    let viewModel = PlayerDetailsViewModel()
    
    // views
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backViewHeight: NSLayoutConstraint!
    @IBOutlet weak var playerImageHeight: NSLayoutConstraint!
    @IBOutlet weak var playerDetailsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Outlets
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup View
    func setupView(){
        playerImage.addBorder(color: UIColor.white, width: 1)
        playerImage.round(40)
        setupTableView()
        setupBiners()
        Task{
            guard let playerId = self.playerId else {return}
            await viewModel.getPlayer(id: playerId)
        }
    }
    
    // setup binder
    func setupBiners(){
        viewModel.$playerStats.sink { playersStat in
            guard let playersStat = playersStat else {return}
            self.playersStat = playersStat
            DispatchQueue.main.async {
                self.dataSetup()
            }
            self.realoadTableData()
        }.store(in: &cancellables)
        
        viewModel.$isLoading.sink {[weak self] isLoading in
            guard let self  = self else {return}
            DispatchQueue.main.async {
                if isLoading{
                    self.activityIndicator.startAnimating()
                }else{
                    self.activityIndicator.stopAnimating()
                }
            }
        }.store(in: &cancellables)
        
        viewModel.$errorHandler.sink { [weak self] err in
            guard let self = self else {return}
            guard let err = err else{return}
            let errorPopup = ErrorPopupBuilder()
                .setTitle("Error!")
                .setMessage(err.localizedDescription)
                
                .addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                    guard let playerId = self.playerId else{return}
                    Task{ await self.viewModel.getPlayer(id: playerId)} // retry the function
                }))
                .build()
            
            DispatchQueue.main.async {
                errorPopup?.show()
            }
        }.store(in: &cancellables)
        
    }
    
    func dataSetup(){
        let playerImage = URL(string: playersStat?.playerImage ?? "")
        self.playerImage.sd_setImage(with: playerImage, placeholderImage: UIImage(systemName: "photo"))
        guard let playersStat = playersStat else {return}
        self.playerName.text = (playersStat.name ?? "Unknown") + " " + "(\(playersStat.position?.name ?? ""))"
        self.countryName.text = playersStat.country?.name
        self.battingStyle.text = playersStat.battingStyle
        self.birthDate.text = playersStat.birthDate
        self.bowlingStyle.text = playersStat.bowlingStyle
    }
}
