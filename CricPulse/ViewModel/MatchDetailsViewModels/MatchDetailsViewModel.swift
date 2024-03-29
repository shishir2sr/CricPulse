import Foundation
import UIKit

class MatchDetailsViewModel{
    
    // Repository
    private let remoteFixtureRepository : RemoteFixtureRepository
    static var shared = MatchDetailsViewModel()
    @Published var matchDetailsData: MatchDetailsData?
    @Published var isLoading = false
    @Published var errorHandler: CustomError?
    
    // MARK: Init ViewModel
    init(remoteFixtureRepository: RemoteFixtureRepository = RemoteFixtureRepository()) {
        self.remoteFixtureRepository = remoteFixtureRepository
    }
    
    // get fixtures by id
    func getFixture(id: Int)async {
        self.isLoading = true
        let data: Result<Fixture,CustomError> = await remoteFixtureRepository.getFixtureById(id: id)
        self.isLoading = false
        switch data{
        case .success(let data):
            matchDetailsData = MatchDetailsDataGenerator.matchDetailsGenerator(data.data)
        case .failure(let error):
            print(error)
            print(error.localizedDescription)
            self.errorHandler = error
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
    
    //  StadiumInfo
    func getStadiumInfo()-> String{
        let name = matchDetailsData?.stadiumInfo?.name
        let city = matchDetailsData?.stadiumInfo?.city
        return "\(name ?? ""), \(city ?? "")"
    }
    
    // statusColor
    func getMatchStatusColor() -> UIColor{
        switch matchDetailsData?.matchStatus{
        case .aban:
            return UIColor.gray.withAlphaComponent(0.4)
        case .finished:
            return UIColor.blue.withAlphaComponent(0.4)
        case .ns:
            return UIColor.systemGreen.withAlphaComponent(0.4)
        case .the1StInnings:
            return UIColor.red.withAlphaComponent(0.4)
        case .the2NdInnings:
            return UIColor.red.withAlphaComponent(0.4)
        case .innigsBreak:
            return UIColor.red.withAlphaComponent(0.4)
        case .int:
            return UIColor.gray.withAlphaComponent(0.4)
        case .some(_):
            return UIColor.red.withAlphaComponent(0.4)
        case .none:
            return UIColor.cyan
        }
    }
    
    // Countdown Timer
    func remainingTime() -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: matchDetailsData?.matchDate ?? Date())
        guard let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second else {
            return ""
        }
        return String(format: "\(days) days, \(hours) hours, \(minutes), \(seconds) seconds to toss")
    }
}


