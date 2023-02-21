import Foundation

import UIKit
class FinishedMatchScoreCardTVModel{
    // variables
    let tournamentId : Int?
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
        
        if scorecard.runs?.count ?? 0 < 2 {
            // LocalTeam Data
            self.localTeamName = scorecard.localteam?.code ?? "Unknown"
            self.localTeamFlagUrl = scorecard.localteam?.image_path ?? ""
            self.localTeamScore =  "..."
            
            // Visitor Team Data
            self.visitorTeamName = scorecard.visitorteam?.code ?? "Unknown"
            self.visitorTeamFlagUrl = scorecard.visitorteam?.image_path ?? "Unknown"
            self.visitorTeamScore = "..."
            
        }else{
            let team1 = scorecard.runs?[0].team
            let team2 = scorecard.runs?[1].team
            
            // LocalTeam Data
            self.localTeamName = team1?.code ?? "Unknown"
            self.localTeamFlagUrl = team1?.image_path ?? ""
            self.localTeamScore =  MainViewModel.getScore(for: 0, dataClass: scorecard)
            
            // Visitor Team Data
            self.visitorTeamName = team2?.code ?? "Unknown"
            self.visitorTeamFlagUrl = team2?.image_path ?? ""
            self.visitorTeamScore = MainViewModel.getScore(for: 1, dataClass: scorecard)
        }
        
        self.tournamentName = scorecard.league?.name ?? "Unknown"
        self.matchNo = scorecard.round ?? "--"
        self.matchUpdateText = scorecard.note ?? "Please wait..."
        self.startingDate = scorecard.starting_at ?? Date()
        self.manOfTheMatch = "" // TODO: Man of the match
        self.gameType = scorecard.type ?? "--"
        self.tournamentId = scorecard.id
        
    }
    
    // identifier
    static var identifier: String {
        return Constants.homeTableCellReuseIdentifier
    }
    
    // Register Xib file
    static func register() -> UINib {
//        UINib(nibName: "HomeTVCell", bundle: nil)
        UINib(nibName: Constants.homeTableCellXibName, bundle: nil)
    }
}
