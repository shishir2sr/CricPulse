import Foundation

import UIKit
class FinishedMatchScoreCardTVModel{
    // variables
    let tournamentName: String
    let matchNo: String
    let localTeamName: String
    let visitorTeamName: String
    let gameType: String
    let localTeamScore: String
    let visitorTeamScore: String
    let matchUpdateText: String
    let localTeamFlagUrl: String
    let visitorTeamFlagUrl: String
    let startingDate: Date
    let manOfTheMatch: String
    
    
    init(scorecard: FixtureDataClass) {
        self.tournamentName = scorecard.league?.name ?? "Unknown"
        self.matchNo = scorecard.round ?? "--"
        self.localTeamName = scorecard.localteam?.code ?? "Unknown"
        self.visitorTeamName = scorecard.visitorteam?.code ?? "Unknown"
        self.gameType = scorecard.type ?? "--"
        self.localTeamScore = scorecard.localteam_dl_data?.score ?? "--"
        self.visitorTeamScore = scorecard.visitorteam_dl_data?.score ?? "--"
        self.matchUpdateText = scorecard.note ?? "Please wait..."
        self.localTeamFlagUrl = scorecard.localteam?.image_path ?? ""
        self.visitorTeamFlagUrl = scorecard.visitorteam?.image_path ?? ""
        self.startingDate = scorecard.starting_at ?? Date()
        self.manOfTheMatch = "" // TODO: Man of the match
    }
    
    // identifier
    static var identifier: String {
        return Constants.homeTableCellReuseIdentifier
    }
    
    // Register Xib file
    static func register() -> UINib {
        UINib(nibName: "HomeTVCell", bundle: nil)
    }
}
