import Foundation

struct BattingsDataClass: Codable {
    let id: Int?
    let sort: Int?
    let fixture_id: Int?
    let team_id: Int?
    let player_id: Int?
    let ball: Int?
    let score_id: Int?
    let score: Double?
    let four_x: Int?
    let six_x: Int?
    let rate: Double?
    let updated_at: Date?
    let batsman: PlayerDataClass?
}
