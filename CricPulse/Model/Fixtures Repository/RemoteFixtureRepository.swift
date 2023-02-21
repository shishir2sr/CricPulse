import Foundation

class RemoteFixtureRepository: FixtureRepository{
    func getFixtures() async -> Result<Fixtures, CustomError>{
        let includeString = "localteam,visitorteam,league,venue,runs.team"
        let url = EndPoint.shared.getFixtures(with: [.include(includeString),.sort("-updated_at"), .fileter(name: "type", values: "T20"),])
        // get data
        let data: Result<Fixtures,CustomError> = await ApiClient.shared.fetchData(url: url)
        return data 
    }
    
    func getFixtureById(id: Int) async {
        print("Implementlater") // TODO: Get fixture by id
    }
    
    
}
