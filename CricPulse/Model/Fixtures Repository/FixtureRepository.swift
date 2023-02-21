import Foundation
protocol FixtureRepository {
  func getFixtures() async -> Result<Fixtures,CustomError>
  func getFixtureById(id: Int) async
}
