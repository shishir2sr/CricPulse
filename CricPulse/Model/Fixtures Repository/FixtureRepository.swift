import Foundation
protocol FixtureRepository {

    /// Get Fixtures from sportMonks api
    /// - Returns: Result with success at left or Failure at right
    func getFixtures(url: URL?) async -> Result<Fixtures,CustomError>
    
  func getFixtureById(id: Int) async -> Result<Fixture,CustomError>
}
