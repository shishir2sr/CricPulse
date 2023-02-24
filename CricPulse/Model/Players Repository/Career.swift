
import Foundation

// MARK: - Career Model
struct Career: Codable{
    let type: String?
    let bowling: Bowling?
    let batting: Batting?
    
    struct Bowling: Codable{
        let matches: Int?
        let overs: Double?
        let innigs: Int?
        let econ_rate: Double?
        let runs: Int?
        let wickets: Int?
    }
    struct Batting:  Codable{
        let matches: Int?
        let innings: Int?
        let runs_scored: Int?
        let strike_rate: Double?
        let balls_faced: Double?
        let average: Double?
    }
}
