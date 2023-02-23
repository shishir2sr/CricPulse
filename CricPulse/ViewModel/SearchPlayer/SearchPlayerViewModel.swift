
import Foundation
import UIKit

class SearchPlayerViewModel{
    // Repository
    private let remotePlayerRepository : RemotePlayersRepository
    // variables
    var dataSource: [PlayerDataClass] = []
    init(remotePlyerRepository: RemotePlayersRepository = RemotePlayersRepository()){
        self.remotePlayerRepository = remotePlyerRepository
    }
    
    // Get Players
    func getPlayers()async {
        let data: Result<[CDPlayer],CustomError> = await remotePlayerRepository.getPlayers()
        switch data{
        case .success(let data):
            print("Coredata: ",data[0].name)
        case .failure(let error):
            print(error)
        }
    }
        
        
        
        // MARK: - TableView Logics
        // Decides tableviews number of rows
        func numberOfRows(in section: Int )-> Int{
            return 5
        }
        
        // Decides number of sections in tableview
        func numberOfSection()-> Int{
            return 0
        }
        
        // xib registration
        func registerNib()-> UINib{
            return UINib(nibName: Constants.searchPlayerTVCell, bundle: nil)
        }
    }
    

