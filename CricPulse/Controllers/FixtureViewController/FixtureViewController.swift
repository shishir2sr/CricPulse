import UIKit
import Combine
class FixtureViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButtonOutlet: UIButton!
    
    // ViewModel
    let viewModel = FixtureViewModel()
    var fixtureData:[FinishedMatchScoreCardTVModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupView()
        setupBinder()
    }
    
    // MARK: - View
    func setupView(){
        filterButtonOutlet.round(5)
        let url = getUrl(for: "T20")
        Task{ await viewModel.getFixtures(for: url)}
    }
    
    func setupBinder(){
        viewModel.$fixtureData.sink { fixtures in
            self.fixtureData = fixtures
            self.reloadTablerView()
        }.store(in: &cancellables)
    }
    
    @IBAction func filterButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func segmentControll(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            case 0:
            let url = getUrl(for: "T20")
            Task{ await viewModel.getFixtures(for: url)}
            
            case 1:
            let url = getUrl(for: "T20I")
            Task{ await viewModel.getFixtures(for: url)}
            case 2:
            let url = getUrl(for: "T10")
            Task{ await viewModel.getFixtures(for: url)}
          case 3:
            let url = getUrl(for: "ODI")
            Task{ await viewModel.getFixtures(for: url)}
                debugPrint("Third segment")
            default:
                break
        }
    }
    
    func getUrl(for leagueName: String) -> URL?{
        let fromDateString = viewModel.formatDate(date: fromDate.date)
        let toDateString = viewModel.formatDate(date: toDate.date)
        let url = EndPoint.shared.getFixtures(with: [.include("localteam,visitorteam,league,venue,runs.team"),
             .filter(name: "type", values: "\(leagueName)"),
            .filter(name: "starts_between", values: "\(fromDateString),\(toDateString)")
        ])
        return url
    }
    
}
