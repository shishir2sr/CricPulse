import UIKit
class FixtureViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupView()
        setupBinder()

    }
    
    // MARK: - View
    func setupView(){
        filterButtonOutlet.round(5)
    }
    
    func setupBinder(){
        
    }
    
    @IBAction func filterButtonAction(_ sender: UIButton) {
        
    }
    

}
