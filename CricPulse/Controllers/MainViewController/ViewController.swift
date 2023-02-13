
import UIKit
class ViewController: UIViewController {
    // ViewModel
    let mainViewModel = MainViewModel()
    // Outlets
    @IBOutlet weak var HomeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureViewDidLoad()
    }
    
    fileprivate func ConfigureViewDidLoad(){
        setupCollectionView()
    }
}
