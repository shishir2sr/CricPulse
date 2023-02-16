
import UIKit
import Combine

class ViewController: UIViewController {
    // Variables
    var scores: [ScoreBoardCollectionViewModel] = []
    private var cancellables = Set<AnyCancellable>()
    // ViewModel
    let mainViewModel = MainViewModel()

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
    
    fileprivate func ConfigureViewDidLoad(){
        setupCollectionView()
        setupTableView()
        setupBinders()
        // TODO: Change according to use case
        Task{
           await mainViewModel.getFixture()
        }
    }
    
    func setupBinders(){
        mainViewModel.$fixtures.sink { scores in
            self.scores = scores
            self.reloadCollectionView()
        }.store(in: &cancellables)
    }
}
