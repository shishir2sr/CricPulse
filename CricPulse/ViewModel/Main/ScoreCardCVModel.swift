import Foundation
import UIKit

class ScoreCardCVModel{
    // Variables
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
    let startingDate: Date
    
    // Initialise
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
        self.startingDate = scorecard.starting_at ?? Date()
    }
    
    /// Identifier for cell
    static var identifier: String {
        return Constants.scoreCardIdentifier
    }
    /// Register the xib using the xib name
    static func register() -> UINib {
        UINib(nibName: Constants.scoreCardXibName, bundle: nil)
    }
    
    // Change status color
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
    
    /// Calculate remaining time based on match date
    func remainingTime() -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: now, to: startingDate)
        guard let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second else {
            return ""
        }
        return String(format: "\(days) days, \(hours) hours, \(minutes), \(seconds) seconds left until the match")
    }
}


