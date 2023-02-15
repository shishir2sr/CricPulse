
import UIKit
class ViewController: UIViewController {
    // ViewModel
    let mainViewModel = MainViewModel()
    // Outlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureViewDidLoad()
    }
    
    fileprivate func ConfigureViewDidLoad(){
        setupCollectionView()
        setupTableView()
    }
}
