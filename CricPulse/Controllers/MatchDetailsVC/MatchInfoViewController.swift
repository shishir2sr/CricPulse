
import UIKit
import Combine
class MatchInfoViewController: UIViewController {
    var matchDetailsViewModel = MatchDetailsViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    var matchDetailsVM: MatchDetailsData?
    
    @IBOutlet weak var matchInfoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinder()
    }
    
    func setupBinder(){
        matchDetailsViewModel.$matchDetailsData.sink { matchDetails in
            DispatchQueue.main.async {
                if let matchDetails = matchDetails{
                    self.matchDetailsVM = matchDetails
                    self.realoadTableView()
                }
            }
        }.store(in: &cancellables)
    }
    
}


