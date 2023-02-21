import Foundation

class MatchDetailsDataGenerator{
    
    static func matchDetailsGenerator(_ fixture: FixtureDataClass) -> MatchDetailsData  {
    
        // MARK: Components
        var localTeamRuns: Runs?
        var visitorTeamRuns: Runs?
        var localTeamSquadList : [PlayerDataClass] = []
        var visitorTeamSquadList : [PlayerDataClass] = []
        var localTeamBowlingScore : [BowlingDataClass] = []
        var visitorTeamBowlingScore : [BowlingDataClass] = []
        var localTeamBattingScore : [BattingsDataClass] = []
        var visitorTeamBattingScore : [BattingsDataClass] = []
        
        
        // get squadlist
        if let lineup = fixture.lineup {
            localTeamSquadList = lineup.filter { $0.lineup?.team_id == fixture.localteam_id }
            visitorTeamSquadList = lineup.filter { $0.lineup?.team_id != fixture.localteam_id }
        }
        
        // Get bowling lineup
        if let bowlingLineUp = fixture.bowling{
            localTeamBowlingScore = bowlingLineUp.filter { $0.team_id == fixture.localteam_id }
            visitorTeamBowlingScore = bowlingLineUp.filter { $0.team_id != fixture.visitorteam_id }
        }
    
        // batting Score
        if let batting = fixture.batting {
            localTeamBattingScore = batting.filter { $0.team_id == fixture.localteam_id }
            visitorTeamBattingScore = batting.filter { $0.team_id != fixture.localteam_id }
        }
        
        // MARK: Find Run for local team or visitor team
        if let run = fixture.runs {
            if run.count == 1 {
                if fixture.localteam_id == run[0].team_id {
                    localTeamRuns = run[0]
                } else {
                    visitorTeamRuns = run[0]
                }
            } else if run.count > 1 {
                if fixture.localteam_id == run[0].team_id {
                    localTeamRuns = run[0]
                    visitorTeamRuns = run[1]
                } else {
                    localTeamRuns = run[1]
                    visitorTeamRuns = run[0]
                }
            }
        }
        
        return MatchDetailsData(tournamentName: fixture.league?.name,
                                matchNo: fixture.round,
                                matchStatus: fixture.status,
                                matchType: fixture.type,
                                matchDate: fixture.starting_at,
                                matchNote: fixture.note,
                                mOMImageUrl: fixture.manofmatch?.image_path,
                                mOMName: fixture.manofmatch?.fullname,
                                mOMTeamFlag: fixture.manofmatch?.image_path,
                                teamOneFlagUrl: fixture.localteam?.image_path,
                                teamOneCode: fixture.localteam?.code,
                                teamOneScore: localTeamRuns,
                               teamOneWinPercentage: "50%", //TODO: Later
                               teamOneSquad: localTeamSquadList,
                               teamOneBowling: localTeamBowlingScore,
                               teamOneBatting: localTeamBattingScore,
                                teamTwoFlagUrl: fixture.visitorteam?.image_path,
                                teamTwoCode: fixture.visitorteam?.code,
                               teamTwoScore: visitorTeamRuns,
                               teamTwoWinPercentage: "50%", // TODO: later
                               teamTwoSquad: visitorTeamSquadList,
                               teamTwoBowling: visitorTeamBowlingScore,
                               teamTwoBatting: visitorTeamBattingScore
       )
        
    }
    
}


struct MatchDetailsData{
    // Match informations
    let tournamentName: String?
    let matchNo: String?
    let matchStatus: Status?
    let matchType: String?
    let matchDate: Date?
    let matchNote: String?
    
    // Man of the match informations
    let mOMImageUrl: String?
    let mOMName: String?
    let mOMTeamFlag: String?
    
    // Team One informations
    let teamOneFlagUrl: String?
    let teamOneCode: String?
    let teamOneScore: Runs?
    let teamOneWinPercentage: String?
    let teamOneSquad: [PlayerDataClass]?
    let teamOneBowling: [BowlingDataClass]?
    let teamOneBatting: [BattingsDataClass]?
    
    // Team Two Informations
    let teamTwoFlagUrl: String?
    let teamTwoCode: String?
    let teamTwoScore: Runs?
    let teamTwoWinPercentage: String?
    let teamTwoSquad: [PlayerDataClass]?
    let teamTwoBowling: [BowlingDataClass]?
    let teamTwoBatting: [BattingsDataClass]?
    
}



