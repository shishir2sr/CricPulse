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
    
    // get Score
    func getTeamOneScore() -> String{
        let matchScore = matchDetailsData?.teamOneScore?.score ?? 00
        let wickets = matchDetailsData?.teamOneScore?.wickets ?? 0
        let overs = matchDetailsData?.teamOneScore?.overs ?? 0
        return "\(matchScore)/\(wickets)(\(overs))"
    }
    // get Score
    func getTeamTwoScore() -> String{
        let matchScore = matchDetailsData?.teamTwoScore?.score ?? 00
        let wickets = matchDetailsData?.teamTwoScore?.wickets ?? 0
        let overs = matchDetailsData?.teamTwoScore?.overs ?? 0
        return "\(matchScore)/\(wickets)(\(overs))"
    }
}


