import UIKit

class DetailedScoreViewController: UIViewController {
    // Viewmodels
    var viewmodel: DetailedScoreViewModel = DetailedScoreViewModel()
    
    
    // Outlets
    @IBOutlet weak var matchDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
    }
    // TableView Stup
    func configViewDidLoad(){
        setupTableView()
    }
}
