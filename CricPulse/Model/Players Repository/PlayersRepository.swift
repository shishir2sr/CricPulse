import Foundation

protocol PlayerRepository {
    func getPlayers() async -> Result<[CDPlayer],CustomError>
    func getPlayerById(id: Int) async -> Result<PlayerDataClass, CustomError>
    
}

class RemotePlayersRepository: PlayerRepository{
    
    func getPlayers() async -> Result<[CDPlayer], CustomError> {
        // Check ifn coredata has data
        let  playersFromCoreData = await CoreDataHelper.shared.fetchPlayers()
        guard let playersFromCoreData = playersFromCoreData else {return .failure(.unableToComplete)}
        if playersFromCoreData.count > 0 {
            return .success(playersFromCoreData)
        } else {
            let url = EndPoint.shared.getPlayers(with: [.fields(object: "players", parameters: "fullname,id,image_path")])
            let result: Result<Players, CustomError> = await ApiClient.shared.fetchData(url: url)
            
            switch result {
            case .success(let players):
                // Save to coredata and fetch again from it
                await CoreDataHelper.shared.savePlayers(players: players.data)
                guard let playersFromCD = await CoreDataHelper.shared.fetchPlayers() else { return .failure(.unableToComplete)}
                return .success(playersFromCD)
                
            case .failure(let error):
                return .failure(error)
            }
        }
    }
    
    func getPlayerById(id: Int) async -> Result<PlayerDataClass, CustomError> {
        // get playerBy id using async await function
        let url = EndPoint.shared.getPlayer(ID: id)
        let data: Result<PlayerDataClass,CustomError> = await ApiClient.shared.fetchData(url: url)
        return data
    }
}




/**
 let url = EndPoint.shared.getPlayers(with: [.fields(object: "players", parameters: "fullname,id,image_path")])
 let data: Result<Players,CustomError> = await ApiClient.shared.fetchData(url: url)
 return data
 */
