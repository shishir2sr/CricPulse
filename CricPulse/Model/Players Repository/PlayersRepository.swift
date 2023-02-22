import Foundation
protocol PlayerRepository {
  func getPlayers() async -> Result<Players,CustomError>
  func getPlayerById(id: Int) async -> Result<PlayerDataClass, CustomError>
  func setPlayers() async
  func isLocalRepositoryAvailable() -> Bool
}


