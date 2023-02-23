
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
        let data: Result<Players,CustomError> = await remotePlayerRepository.getPlayers()
        handleResponse(data: data)
    }
    // Handle parsed data
    func handleResponse(data: Result<Players,CustomError>){
        switch data{
        case .success(let players):
            self.dataSource = players.data
            
        case .failure(let err):
            debugPrint(err.localizedDescription) // TODO: Do something to the UI
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

