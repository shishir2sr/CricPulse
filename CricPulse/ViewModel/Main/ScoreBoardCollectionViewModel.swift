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
    init(tournamentName: String, matchNo: String, matchStatus: String, stadiumName: String, localTeamName: String, visitorTeamName: String, gameType: String, localTeamScore: String, visitorTeamScore: String, matchUpdateText: String, localTeamFlagUrl: String, visitorTeamFlagUrl: String) {
        self.tournamentName = tournamentName
        self.matchNo = matchNo
        self.matchStatus = matchStatus
        self.stadiumName = stadiumName
        self.localTeamName = localTeamName
        self.visitorTeamName = visitorTeamName
        self.gameType = gameType
        self.localTeamScore = localTeamScore
        self.visitorTeamScore = visitorTeamScore
        self.matchUpdateText = matchUpdateText
        self.localTeamFlagUrl = localTeamFlagUrl
        self.visitorTeamFlagUrl = visitorTeamFlagUrl
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
