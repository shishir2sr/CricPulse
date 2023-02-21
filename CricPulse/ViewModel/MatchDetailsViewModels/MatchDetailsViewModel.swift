

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
            print("Data parsed", data.data.batting![0].batsman?.fullname) // TODO: Do something
        case .failure(let error):
            print(error)
        }
    }
    
    
}
