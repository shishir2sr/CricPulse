import UIKit

class PlayerDetailsViewController: UIViewController {
    // Variables
    var playerId:Int? = nil
    
    // ViewModel
    let viewModel = PlayerDetailsViewModel()
    
    // views
    @IBOutlet weak var backView: UIView!
    
    // tableview
    @IBOutlet weak var playerDetailsTableView: UITableView!
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
        Task{
            guard let playerId = self.playerId else {return}
            await viewModel.getPlayer(id: playerId)
        }
    }

}
