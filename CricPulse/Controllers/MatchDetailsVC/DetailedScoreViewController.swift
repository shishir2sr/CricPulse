import UIKit

class DetailedScoreViewController: UIViewController {
    
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