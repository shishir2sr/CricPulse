import Foundation
import UIKit

class ScoreBoardCollectionViewModel{
    let tournamentName: String
    let matchNo: String
    let matchStatus: String // Live, Upcoming, Finished etc
    let stadiumName: String
    let localTeamName: String
    let visitorTeamName: String
    let gameType: String // t20, t20I etc.
    let localTeamScore: String
    let visitorTeamScore: String
    let matchUpdateText: String // bd won by 29 runs, Need 105 runs to win, etc.
    let localTeamFlagUrl: String
    let visitorTeamFlagUrl: String
    
    // TODO: Recieve Model Class Variable and assign those
    init(scorecard: FixtureDataClass) {
        self.tournamentName = scorecard.league_id.codingKey.stringValue // TODO: Fix Model class
        self.matchNo = scorecard.round ?? "--"
        self.matchStatus = scorecard.status ?? "--"
        self.stadiumName = scorecard.venue_id?.codingKey.stringValue ?? "__" // TODO: Fix Later
        self.localTeamName = scorecard.localteam?.name ?? "Unknown"
        self.visitorTeamName = scorecard.visitorteam?.name ?? "Unknown"
        self.gameType = scorecard.type ?? "--"
        self.localTeamScore = scorecard.localteam_dl_data?.score ?? "--"
        self.visitorTeamScore = scorecard.visitorteam_dl_data?.score ?? "--"
        self.matchUpdateText = scorecard.note ?? "Please wait..."
        self.localTeamFlagUrl = scorecard.localteam?.image_path ?? ""
        self.visitorTeamFlagUrl = scorecard.visitorteam?.image_path ?? ""
    }
    
    /// Identifier for cell
    static var identifier: String {
        return Constants.scoreCardIdentifier
    }
    /// Register the xib using the xib name
    static func register() -> UINib {
        UINib(nibName: Constants.scoreCardXibName, bundle: nil)
    }
}


/**
 
 // Label Outlets
 tournamentTitle: UILabel!
 matchNo: UILabel!
 matchStatusLabel: UILabel!  // Live or Upcoming or Completed
 stadiumName: UILabel!
 lTeamName: UILabel!
 vTeamName: UILabel!
 gameType: UILabel!
lTeamScoreOne: UILabel!
vTeamScoreOne: UILabel!
 textualScoreLabel: UILabel!
 
 //Image Outlets
 lTeamFlag: UIImageView!
 vTeamFlag: UIImageView!
 
 */
