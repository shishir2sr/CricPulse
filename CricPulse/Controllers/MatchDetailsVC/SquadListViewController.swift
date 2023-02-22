import UIKit
import Combine

class SquadListViewController: UIViewController {
    
    var matchDetailsViewModel = MatchDetailsViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    var teamOneSquadList: [PlayerDataClass] = []
    var teamTwoSquadList: [PlayerDataClass] = []
    
// Outlets
    @IBOutlet weak var squadListTableView: UITableView!
    
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSquadTableVIew()
        setupBinder()
    }
    
    // binder stup
    func setupBinder(){
        matchDetailsViewModel.$matchDetailsData.sink {[weak self] matchData in
            guard let self = self else {return}
            guard let matchData = matchData else {return}
            self.teamOneSquadList = matchData.teamOneSquad ?? []
            self.teamTwoSquadList = matchData.teamTwoSquad ?? []
            self.realoadTableView()
            
        }
    }

}
