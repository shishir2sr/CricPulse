import Foundation
protocol PlayerRepository {
  func getPlayers() async -> Result<Players,CustomError>
  func getPlayerById(id: Int) async
  func setPlayers() async
}
