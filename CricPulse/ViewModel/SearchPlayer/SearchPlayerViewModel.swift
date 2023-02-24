import Foundation
import UIKit

class SearchPlayerViewModel{
    // Repository
    private let remotePlayerRepository : ConcreatePlayerRepository
    // variables
    @Published var isLoading: Bool = false
    @Published var playersData:[CDPlayer] = []
    
    init(remotePlyerRepository: ConcreatePlayerRepository = ConcreatePlayerRepository()){
        self.remotePlayerRepository = remotePlyerRepository
    }
    
    /// Get Players
    func getPlayers()async {
        isLoading = true
        let data: Result<[CDPlayer],CustomError> = await remotePlayerRepository.getPlayers()
        isLoading = false
        switch data{
        case .success(let data):
            playersData = data
        case .failure(let error):
            print(error)
        }
    }
    
    
        // MARK: - TableView Logics
        /// Decides tableviews number of rows
        func numberOfRows(in section: Int )-> Int{
            playersData.count
        }
        
        /// Decides number of sections in tableview
        func numberOfSection()-> Int{
            return 0
        }
        
        /// xib registration
        func registerNib()-> UINib{
            return UINib(nibName: Constants.searchPlayerTVCell, bundle: nil)
        }
    }
    

