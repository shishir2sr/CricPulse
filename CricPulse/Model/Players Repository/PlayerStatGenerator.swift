import Foundation

/**
// MARK: - MatchType Enums
enum CareerType: String {
    case t20 = "T20"
    case odi = "ODI"
    case test = "Test/5day"
    case t20i = "T20I"
}

// MARK: - Players Statistics
struct PlayerStats: Codable {
    let id: Int?
    let name: String?
    let playerImage: String?
    let birthDate: String?
    let position: Position?
    let battingStyle: String?
    let bowlingStyle: String?
    let lineUp: LineupLineup?
    let country: Country?
    let t20Stats: Career?
    let t20iStats: Career?
    let testStats: Career?
    let odiStats: Career?
}

class PlayerStatGenerator {
    
    static func generatePlayersStat(player: PlayerDataClass) -> PlayerStats{
        let playerCareer = player.career ?? []
        let t20 = calculateCareerData(careerData: playerCareer, type: .t20)
        let t20i = calculateCareerData(careerData: playerCareer, type: .t20i)
        let test = calculateCareerData(careerData: playerCareer, type: .test)
        let odi = calculateCareerData(careerData: playerCareer, type: .odi)
        
        let careerStats = PlayerStats(
            id: player.id, name: player.fullname, playerImage: player.image_path, birthDate: player.dateofbirth, position: player.position, battingStyle: player.bowlingstyle, bowlingStyle: player.bowlingstyle,lineUp: player.lineup,country: player.country,
            
            t20Stats: t20,
            t20iStats: t20i,
            testStats: test,
            odiStats: odi
        )
        
        return playerCareerModel
    }
    
    
    static func calculateCareerData(careerData: [Career], type: CareerType) -> Career{
        
        
        return Career(from: <#Decoder#>)
    }
    
}

*/


/**
class PlayerStatGenerator {
    
    static func generatePlayersStat(player: PlayerDataClass) -> PlayerStats{
        let playerCareer = player.career ?? []
        let playerCareerModel = PlayerStats(
            id: player.id,
            name: player.fullname,
            playerImage: player.image_path,
            birthDate: player.dateofbirth,
            position: player.position,
            battingStyle: player.bowlingstyle,
            bowlingStyle: player.bowlingstyle,
            lineUp: player.lineup,
            country: player.country,
            
            t20Career: analyzeCareerData(careerData: playerCareer, type: "T20"),
            odiCareer: analyzeCareerData(careerData: playerCareer, type: "ODI"),
            testCareer: analyzeCareerData(careerData: playerCareer, type: "Test/5day"),
            t20iCareer: analyzeCareerData(careerData: playerCareer, type: "T20I")
        )
        
        return playerCareerModel
    }
    
    static func analyzeCareerData(careerData: [Career], type: String) -> Career {
        var matchesBating = 0
        var inningsBating = 0
        var runs_scored = 0
        var strike_rate = 0.0
        var balls_faced = 0.0
        var average = 0.0
        var matchesBowling = 0
        var inningsBowling = 0
        var overs = 0.0
        var econ_rate = 0.0
        var runs = 0
        var wickets = 0
        
        for career in careerData {
            if career.type == type {
                if career.batting != nil {
                    matchesBating += career.batting?.matches ?? 0
                    inningsBating += career.batting?.innings ?? 0
                    runs_scored += career.batting?.runs_scored ?? 0
                    balls_faced += career.batting?.balls_faced ?? 0.0
                }
                
                if career.bowling != nil {
                    matchesBowling += career.bowling?.matches ?? 0
                    inningsBowling += career.bowling?.innigs ?? 0
                    overs += career.bowling?.overs ?? 0.0
                    runs += career.bowling?.runs ?? 0
                    wickets += career.bowling?.wickets ?? 0
                }
            }
        }
        
        //calculate Strike Rate and Average
        strike_rate = (Double(runs_scored) / balls_faced) * 100
        average = Double(runs_scored) / Double(inningsBating)
        //calculate Economy Rate
        econ_rate = Double(runs) / overs
        
        let careerModel = Career(
            type: type,
            bowling: BowlingTwo(
                matches: matchesBowling,
                overs: overs,
                innigs: inningsBowling,
                econ_rate: econ_rate,
                runs: runs,
                wickets: wickets
            ),
            batting: BattingTwo(
                matches: matchesBating,
                innings: inningsBating,
                runs_scored: runs_scored,
                strike_rate: strike_rate,
                balls_faced: balls_faced,
                average: average
            )
        )
        
        return careerModel
    }
}


// MARK: - Player Stat model
struct PlayerStats: Codable {
    let id: Int?
    let name: String?
    let playerImage: String?
    let birthDate: String?
    let position: Position?
    let battingStyle: String?
    let bowlingStyle: String?
    let lineUp: LineupLineup?
    let country: Country?
    let t20Career: Career?
    let odiCareer: Career?
    let testCareer: Career?
    let t20iCareer: Career?
}
 */
