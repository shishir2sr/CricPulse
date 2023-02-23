import Foundation

protocol PlayerRepository {
  func getPlayers() async -> Result<Players,CustomError>
  func getPlayerById(id: Int) async -> Result<PlayerDataClass, CustomError>
  
}

class RemotePlayersRepository: PlayerRepository{
    
    func getPlayers() async -> Result<Players, CustomError> {
            // get palyer using asyc await function
        let url = EndPoint.shared.getPlayers(with: [.fields(object: "players", parameters: "fullname,id,image_path")])
            let data: Result<Players,CustomError> = await ApiClient.shared.fetchData(url: url)
            return data
        }
        
        func getPlayerById(id: Int) async -> Result<PlayerDataClass, CustomError> {
           // get playerBy id using async await function
            let url = EndPoint.shared.getPlayer(ID: id)
            let data: Result<PlayerDataClass,CustomError> = await ApiClient.shared.fetchData(url: url)
            return data
        }
}




