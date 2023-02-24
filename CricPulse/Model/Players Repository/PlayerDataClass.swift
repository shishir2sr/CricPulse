import Foundation

// MARK: Player
struct Player: Codable {
    let data: PlayerDataClass?
}

// MARK: Players
struct Players: Codable {
    let data: [PlayerDataClass]
}

// MARK: Player DataClass
struct PlayerDataClass: Codable{
    let resource: String?
    let id, country_id: Int?
    let fullname: String?
    let image_path: String?
    let dateofbirth: String?
    let gender: String?
    let battingstyle: String?
    let bowlingstyle: String?
    let position: Position?
    let updated_at: Date?
    let lineup: LineupLineup?
    let career: [Career]?
    let country: Country?
}

// MARK: Country
struct Country: Codable{
    let id: Int?
    let name: String?
    let image_path:String?
    let updated_at: Data?
}

// MARK: Players positions
struct Position: Codable {
    let resource: String?
    let id: Int?
    let name: String?
}

// MARK: Lineup2
struct LineupLineup: Codable {
    let team_id: Int?
}

