
import UIKit
import Combine

class ViewController: UIViewController {
    // Variables
    var collectionViewData: [ScoreCardCVModel] = []
    var tableViewData: [FinishedMatchScoreCardTVModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    // ViewModel
    let mainViewModel = MainViewModel(fixtureRepository: RemoteFixtureRepository())
    
    // Outlets
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var navigationViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureViewDidLoad()
    }
    
    // View Did Load Configuration
    fileprivate func ConfigureViewDidLoad(){
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
        
        setupCollectionView()
        setupTableView()
        setupBinders()
        // TODO: Change according to use case
        Task{
            await mainViewModel.getFixtures()
        }
    }
    
    // Conmbine variables
    func setupBinders(){
        mainViewModel.$scoreCardForCV.sink {[weak self] scores in
            guard let self  = self else {return}
            self.collectionViewData = scores
            self.reloadCollectionView()
        }.store(in: &cancellables)
        
        mainViewModel.$scoreCardForTV.sink {[weak self] scores in
            guard let self  = self else {return}
            self.tableViewData = scores
            self.reloadTableView()
        }.store(in: &cancellables)
        
        mainViewModel.$isLoading.sink {[weak self] isLoading in
            guard let self  = self else {return}
            DispatchQueue.main.async {
                if isLoading{
                    self.loadingIndicator.startAnimating()
                }else{
                    self.loadingIndicator.stopAnimating()
                }
            }
        }.store(in: &cancellables)
        
        mainViewModel.$errorHandler.sink { [weak self] err in
            guard let self = self else {return}
            let errorPopup = ErrorPopupBuilder()
                .setTitle("Error!")
                .setMessage(err?.localizedDescription ?? "Unknown error")
                .addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                .addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                    Task{ await self.mainViewModel.getFixtures()} // retry the function
                }))
                .build()
            errorPopup?.show()
        }.store(in: &cancellables)
        
    }
}
