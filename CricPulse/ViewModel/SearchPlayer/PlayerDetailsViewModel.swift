import Foundation
import UIKit
class PlayerDetailsViewModel{
    
    @Published var isLoading: Bool = false
    @Published var player: PlayerDataClass? = nil
    
    private let remotePlayerRepository : RemotePlayersRepository
    
    init(remotePlyerRepository: RemotePlayersRepository = RemotePlayersRepository()){
        self.remotePlayerRepository = remotePlyerRepository
    }
    
    // Get player
    func getPlayer(id: Int)async {
        isLoading = true
        let data: Result<PlayerDataClass,CustomError> = await remotePlayerRepository.getPlayerById(id: id)
        isLoading = false
        switch data{
        case .success(let data):
            player = data
        case .failure(let error):
            print(error)
        }
    }
    
    
    // MARK: - TableView Logics
    /// Decides tableviews number of rows
    func numberOfRows(in section: Int )-> Int{
        if section == 0{
            return 5
        }else{
            return 5
        }
    }
    
    /// Decides number of sections in tableview
    func numberOfSection()-> Int{
        return 2
    }

    /// xib registration
    func registerCellXib()-> UINib{
        return UINib(nibName: Constants.playerDetailsTVCell, bundle: nil)
    }
    
    /// xib registration
    func registerHeaderXib()-> UINib{
        return UINib(nibName: Constants.headerForPlayerDetails, bundle: nil)
    }
}
