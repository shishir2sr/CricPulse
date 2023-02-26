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
    
    // MARK: - View Did Load
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
        
        searchPlayerViewModel.$errorHandler.sink { [weak self] err in
            guard let self = self else {return}
            guard let err = err else{return}
            let errorPopup = ErrorPopupBuilder()
                .setTitle("Error!")
                .setMessage(err.localizedDescription)
                .addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                    Task{ await self.searchPlayerViewModel.getPlayers()} // retry the function
                }))
                .build()
            
            DispatchQueue.main.async {
                errorPopup?.show()
            }
            
        }.store(in: &cancellables)
    }
}
