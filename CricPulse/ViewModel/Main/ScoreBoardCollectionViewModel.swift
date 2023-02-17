import Foundation
import UIKit

class ScoreBoardCollectionViewModel{
    let tournamentName: String
    let matchNo: String
    let matchStatus: Status? // Live, Upcoming, Finished etc
    let stadiumName: String
    let localTeamName: String
    let visitorTeamName: String
    let gameType: String // t20, t20I etc.
    let localTeamScore: String
    let visitorTeamScore: String
    let matchUpdateText: String // bd won by 29 runs, Need 105 runs to win, etc.
    let localTeamFlagUrl: String
    let visitorTeamFlagUrl: String
//    let startingDate: String?
    
    @Published var countDownTime: String = ""
    
    // TODO: Recieve Model Class Variable and assign those
    init(scorecard: FixtureDataClass) {
        self.tournamentName = scorecard.league?.name ?? "Unknown"
        self.matchNo = scorecard.round ?? "--"
        self.matchStatus = scorecard.status
        self.stadiumName = (scorecard.venue?.name ?? "Not fixed") + ", " + (scorecard.venue?.city  ?? "")
        self.localTeamName = scorecard.localteam?.code ?? "Unknown"
        self.visitorTeamName = scorecard.visitorteam?.code ?? "Unknown"
        self.gameType = scorecard.type ?? "--"
        self.localTeamScore = scorecard.localteam_dl_data?.score ?? "--"
        self.visitorTeamScore = scorecard.visitorteam_dl_data?.score ?? "--"
        self.matchUpdateText = scorecard.note ?? "Please wait..."
        self.localTeamFlagUrl = scorecard.localteam?.image_path ?? ""
        self.visitorTeamFlagUrl = scorecard.visitorteam?.image_path ?? ""
//        self.startingDate = scorecard.starting_at ?? Date().formatted()
    }
    
    /// Identifier for cell
    static var identifier: String {
        return Constants.scoreCardIdentifier
    }
    /// Register the xib using the xib name
    static func register() -> UINib {
        UINib(nibName: Constants.scoreCardXibName, bundle: nil)
    }
    
    func getMatchStatusColor() -> UIColor{
        switch self.matchStatus{
        case .aban:
            return UIColor.gray.withAlphaComponent(0.5)
        case .finished:
            return UIColor.blue.withAlphaComponent(0.5)
        case .ns:
            return UIColor.systemGreen.withAlphaComponent(0.5)
        case .the1StInnings:
            return UIColor.red.withAlphaComponent(0.5)
        case .the2NdInnings:
            return UIColor.red.withAlphaComponent(0.5)
        case .some(_):
            return UIColor.red.withAlphaComponent(0.5)
        case .none:
            return UIColor.cyan
        }
        
    }
    
//    func getUpcomingMatchCountDownTime(){
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd" // set the date format
//        let endDate =  dateFormatter.date(from: startingDate ?? "2022-02-16 10:30:00") ?? Date()// set the end date
//        let countdownCalendar = Calendar.current
//        let countdownDate = countdownCalendar.dateComponents([.day, .hour, .minute, .second], from: Date(), to: endDate)
//       
//        self.countDownTime = "Countdown Time: \(countdownDate.day!) days, \(countdownDate.hour!) hours, \(countdownDate.minute!) minutes, \(countdownDate.second!) seconds"
//        
//    }
}


