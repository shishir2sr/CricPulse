
import UIKit
class ViewController: UIViewController {
    // ViewModel
    let mainViewModel = MainViewModel()
    // View Outlets
    @IBOutlet weak var navigationBarView: UIView!
    // Outlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    // Constraints outlet
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
        
        // TODO: Change according to use case
        Task{
           await mainViewModel.getFixture()
        }
    }
}
