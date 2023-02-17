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
        self.localTeamName = scorecard.runs?[0].team?.code ?? "Unknown"
        self.visitorTeamName = scorecard.runs?[1].team?.code ?? "Unknown"
        self.gameType = scorecard.type ?? "--"
        
        self.matchUpdateText = scorecard.note ?? "Please wait..."
        self.localTeamFlagUrl = scorecard.localteam?.image_path ?? ""
        self.visitorTeamFlagUrl = scorecard.visitorteam?.image_path ?? ""
        self.startingDate = scorecard.starting_at ?? Date()
        self.manOfTheMatch = "" // TODO: Man of the match
        
        self.localTeamScore =  FinishedMatchScoreCardTVModel.getScore(for: 0, dataClass: scorecard)
        self.visitorTeamScore = FinishedMatchScoreCardTVModel.getScore(for: 1, dataClass: scorecard)
        
    }
    // Get Score
    static func getScore(for team: Int, dataClass: FixtureDataClass) -> String{
        let team = dataClass.runs?[team]
        let score = team?.score
        let wickets = team?.wickets
        let overs = team?.overs
        if let score = score, let wickets = wickets, let overs = overs {
            return "\(score)/\(wickets) (\(overs))"
        }else{
            return "---"
        }
        
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
