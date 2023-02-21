import Foundation

class RemoteFixtureRepository: FixtureRepository{
    
    // MARK: Get fixtures
    func getFixtures() async -> Result<Fixtures, CustomError>{
        let includeString = "localteam,visitorteam,league,venue,runs.team"
        let url = EndPoint.shared.getFixtures(with: [.include(includeString),.sort("-updated_at"), .fileter(name: "type", values: "T20"),])
        // get data
        let data: Result<Fixtures,CustomError> = await ApiClient.shared.fetchData(url: url)
        return data 
    }
    
    func getFixtureById(id: Int) async -> Result<Fixture,CustomError>{
        let includeString = "localteam,visitorteam,league,venue,runs.team,batting.batsman"
        let url = EndPoint.shared.getFixture(Id: id, with: [.include("localteam,visitorteam,league,venue,runs.team, batting.batsman")])
        
        print("Fixture WIth ID URL: ", url!)
        
        let data: Result<Fixture,CustomError> = await ApiClient.shared.fetchData(url: url)
        return data
        
    }
    
    
}
