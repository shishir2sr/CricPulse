import Foundation

class MatchDetailsViewModel{
    
    private let remoteFixtureRepository : RemoteFixtureRepository
    
    // init
    init(remoteFixtureRepository: RemoteFixtureRepository) {
        self.remoteFixtureRepository = remoteFixtureRepository
    }
    
    func getFixture(id: Int)async {
       
        // get data
        let data: Result<Fixture,CustomError> = await remoteFixtureRepository.getFixtureById(id: id)
        
        switch data{
        case .success(let data):
            print("Data parsed", data.data.bowling![0].bowler?.fullname as Any) // TODO: Do something
        case .failure(let error):
            print(error)
        }
    }
    
    
}
