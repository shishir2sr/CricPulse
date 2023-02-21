import Foundation

// MARK: - Balling
struct BowlingDataClass: Codable {
    let id: Int?
    let sort: Int?
    let fixture_id: Int?
    let team_id: Int?
    let player_id: Int?
    let overs: Double?
    let medians: Int?
    let runs: Int?
    let wickets: Int?
    let wide: Int?
    let noball: Int?
    let rate: Double?
    let updated_at: Date?
    let bowler: PlayerDataClass?
}



