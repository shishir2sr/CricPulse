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
        let team1 = scorecard.runs?[0].team
        let team2 = scorecard.runs?[1].team
        
        self.tournamentName = scorecard.league?.name ?? "Unknown"
        self.matchNo = scorecard.round ?? "--"
        self.matchUpdateText = scorecard.note ?? "Please wait..."
        self.startingDate = scorecard.starting_at ?? Date()
        self.manOfTheMatch = "" // TODO: Man of the match
        self.gameType = scorecard.type ?? "--"
        
        // LocalTeam Data
        self.localTeamName = team1?.code ?? "Unknown"
        self.localTeamFlagUrl = team1?.image_path ?? ""
        self.localTeamScore =  MainViewModel.getScore(for: 0, dataClass: scorecard)
        
        // Visitor Team Data
        self.visitorTeamName = team2?.code ?? "Unknown"
        self.visitorTeamFlagUrl = team2?.image_path ?? ""
        self.visitorTeamScore = MainViewModel.getScore(for: 1, dataClass: scorecard)
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
