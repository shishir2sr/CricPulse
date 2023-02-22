import UIKit

class SearchPlayerViewController: UIViewController {
    // Variables
    var searchPlayerViewModel = SearchPlayerViewModel()
    
    // Outlets
    @IBOutlet weak var playersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    // View Did load setup
    func setupView(){
        setupTableView()
    }
}
