import UIKit
import Combine
class SearchPlayerViewController: UIViewController {
    // Variables
    var searchPlayerViewModel = SearchPlayerViewModel()
    private var cancellables = Set<AnyCancellable>()
    var players: [CDPlayer] = []
    
    // Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Fetch Player data
        Task{
            await searchPlayerViewModel.getPlayers()
        }
    }
    
    // View Did load setup
    func setupView(){
        setupTableView()
        setupBinder()
        setupTextField()
    }
    
    // Binder
    func setupBinder(){
        searchPlayerViewModel.$isLoading.sink { isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }.store(in: &cancellables)
        
        searchPlayerViewModel.$playersData.sink { playersData in
            self.players = playersData
            self.reloadTableView()
        }.store(in: &cancellables)
    }
}
