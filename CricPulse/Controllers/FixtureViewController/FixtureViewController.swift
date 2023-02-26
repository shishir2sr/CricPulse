import UIKit
import Combine
class FixtureViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButtonOutlet: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // ViewModel
    let viewModel = FixtureViewModel()
    var fixtureData:[FinishedMatchScoreCardTVModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    var url: URL?
    var leagueName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupView()
        setupBinder()
    }
    
    // MARK: - View
    func setupView(){
        filterButtonOutlet.round(5)
        url = getUrl(for: "T20")
        leagueName = "T20"
        Task{ await viewModel.getFixtures(for: url)}
    }
    
    func setupBinder(){
        viewModel.$fixtureData.sink { fixtures in
            self.fixtureData = fixtures
            self.reloadTablerView()
        }.store(in: &cancellables)
        
        viewModel.$isLoading.sink {[weak self] isLoading in
            guard let self  = self else {return}
            DispatchQueue.main.async {
                if isLoading{
                    self.loadingIndicator.startAnimating()
                }else{
                    self.loadingIndicator.stopAnimating()
                }
            }
        }.store(in: &cancellables)
    }
    
    @IBAction func filterButtonAction(_ sender: UIButton) {
        url = getUrl(for: leagueName)
        Task{ await viewModel.getFixtures(for: url)}
    }
    
    @IBAction func segmentControll(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
            case 0:
            url = getUrl(for: "T20")
            leagueName = "T20"
            Task{ await viewModel.getFixtures(for: url)}
            case 1:
            url = getUrl(for: "T20I")
            leagueName = "T20I"
            Task{ await viewModel.getFixtures(for: url)}
            case 2:
            url = getUrl(for: "T10")
            leagueName = "T10"
            Task{ await viewModel.getFixtures(for: url)}
          case 3:
            url = getUrl(for: "ODI")
            leagueName = "ODI"
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
            .sort("-updated_at"),
            .filter(name: "starts_between", values: "\(fromDateString),\(toDateString)")
        ])
        return url
    }
    
}
