
import UIKit
import Combine

class ViewController: UIViewController {
    // Variables
    var collectionViewData: [ScoreCardCVModel] = []
    var tableViewData: [FinishedMatchScoreCardTVModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    // ViewModel
    let mainViewModel = MainViewModel(fixtureRepository: RemoteFixtureRepository())

    // Outlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureViewDidLoad()
       
    }
    
    // View Did Load Configuration
    fileprivate func ConfigureViewDidLoad(){
        setupCollectionView()
        setupTableView()
        setupBinders()
        // TODO: Change according to use case
        Task{
           await mainViewModel.getFixture()
        }
    }
    
    // Conmbine variables
    func setupBinders(){
        mainViewModel.$scoreCardForCV.sink { scores in
            self.collectionViewData = scores
            self.reloadCollectionView()
        }.store(in: &cancellables)
        
        mainViewModel.$scoreCardForTV.sink { scores in
            self.tableViewData = scores
            self.reloadTableView()
        }.store(in: &cancellables)
    }
}
