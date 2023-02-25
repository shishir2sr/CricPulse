import Foundation

class RemoteFixtureRepository: FixtureRepository{
    
    // MARK: Get fixtures
    func getFixtures() async -> Result<Fixtures, CustomError>{
        let includeString = "localteam,visitorteam,league,venue,runs.team"
        let url = EndPoint.shared.getFixtures(with: [.include(includeString),.sort("-updated_at"), .fileter(name: "type", values: "T20,T20I,Test,ODI,T10"),])
        // get data
        let data: Result<Fixtures,CustomError> = await ApiClient.shared.fetchData(url: url)
        return data 
    }
    
    // MARK: Get fixture by id
    func getFixtureById(id: Int) async -> Result<Fixture,CustomError>{
        let includeString = "localteam,visitorteam,league,venue,runs.team,batting.batsman,bowling.bowler,lineup,manofmatch"
        
        let url = EndPoint.shared.getFixture(Id: id, queryParameters:  [.include(includeString)])
        
        print("Fixture WIth ID URL: ", url!)
        
        let data: Result<Fixture,CustomError> = await ApiClient.shared.fetchData(url: url)
        return data
        
    }
    
    
}
