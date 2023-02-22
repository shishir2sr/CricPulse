import UIKit

class SearchPlayerViewController: UIViewController {
    // Variables
    var searchPlayerViewModel = SearchPlayerViewModel()
    
    // Outlets
    @IBOutlet weak var playersTableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // View Did load setup
    func setupView(){
        setupTableView()
        searchBar.round(5)
        searchBar.addShadow(opecity: 0.8, size: 5, radius: 2, color: UIColor.darkGray)
        searchBar.addBorder(color: UIColor.systemGray6, width: 1)
    }
}
