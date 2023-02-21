import Foundation

class MatchDetailsViewModel{
    
    // Repository
    private let remoteFixtureRepository : RemoteFixtureRepository
    
    @Published var matchDetailsData: MatchDetailsData?
    
    // MARK: Init ViewModel
    init(remoteFixtureRepository: RemoteFixtureRepository) {
        self.remoteFixtureRepository = remoteFixtureRepository
    }
    
    // get fixtures by id
    func getFixture(id: Int)async {
        let data: Result<Fixture,CustomError> = await remoteFixtureRepository.getFixtureById(id: id)
        switch data{
        case .success(let data):
            print("Data parsed", data.data.lineup![0].fullname as Any) // TODO: Do
            matchDetailsData = MatchDetailsDataGenerator.matchDetailsGenerator(data.data)
            
        case .failure(let error):
            print(error)
            print(error.localizedDescription)
        }
    }
}


