import Foundation

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
    let country: Country?
    let t20Stats: Career?
    let t20iStats: Career?
    let testStats: Career?
    let odiStats: Career?
}

// MARK: - Player Stat generator
class PlayerStatGenerator {
    static func generatePlayersStat(player: PlayerDataClass) -> PlayerStats{
        let playersCareer = player.career ?? []
        let t20 = calculateCareerData(careerData: playersCareer, type: .t20)
        let t20i = calculateCareerData(careerData: playersCareer, type: .t20i)
        let test = calculateCareerData(careerData: playersCareer, type: .test)
        let odi = calculateCareerData(careerData: playersCareer, type: .odi)
        
        return PlayerStats(
            id: player.id,
            name: player.fullname,
            playerImage: player.image_path,
            birthDate: player.dateofbirth,
            position: player.position,
            battingStyle: player.bowlingstyle,
            bowlingStyle: player.bowlingstyle,
            country: player.country,
            t20Stats: t20,
            t20iStats: t20i,
            testStats: test,
            odiStats: odi
        )
    }
    
    // MARK: - Career data calculation
    static func calculateCareerData(careerData: [Career], type: CareerType) -> Career{
        
        var (battingTotalMatches, battingScoreInnings, scoreRuns, ballsFaced, strikeRate, wickets, runs, economyRate, overs, bowlingInnings, bowlingScoreMatches, avg) = (0, 0, 0, 0.0, 0.0, 0, 0, 0.0, 0.0, 0, 0, 0.0)
        
        let battingData = careerData.filter { $0.type == type.rawValue}
            .compactMap { $0.batting }
        let bowlingData = careerData.filter { $0.type == type.rawValue }
            .compactMap { $0.bowling }
        
        battingTotalMatches = battingData.reduce(0) { $0 + ($1.matches ?? 0) }
        battingScoreInnings = battingData.reduce(0) { $0 + ($1.innings ?? 0) }
        scoreRuns = battingData.reduce(0) { $0 + ($1.runs_scored ?? 0) }
        ballsFaced = battingData.reduce(0.0) { $0 + Double($1.balls_faced ?? 0.0) }
        wickets = bowlingData.reduce(0) { $0 + ($1.wickets ?? 0) }
        runs = bowlingData.reduce(0) { $0 + ($1.runs ?? 0) }
        overs = bowlingData.reduce(0.0) { $0 + ($1.overs ?? 0) }
        bowlingInnings = bowlingData.reduce(0) { $0 + ($1.innigs ?? 0) }
        bowlingScoreMatches = bowlingData.reduce(0) { $0 + ($1.matches ?? 0) }
        
        strikeRate = ballsFaced > 0 ? Double(scoreRuns) / ballsFaced * 100 : 0.0
        economyRate = overs > 0 ? Double(runs) / overs : 0.0
        avg = wickets > 0 ? Double(runs) / Double(wickets) : 0.0
        
        return Career(
            type: type.rawValue,
            bowling: BowlingTwo(
                matches: bowlingScoreMatches,
                overs: overs,
                innigs: bowlingInnings,
                econ_rate: economyRate,
                runs: runs,
                wickets: wickets
            ),
            batting: BattingTwo(
                matches: battingTotalMatches,
                innings: battingScoreInnings,
                runs_scored: scoreRuns,
                strike_rate: strikeRate,
                balls_faced: ballsFaced,
                average: avg
            )
        )
    }
}


