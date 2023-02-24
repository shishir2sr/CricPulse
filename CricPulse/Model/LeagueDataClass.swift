import Foundation

struct League {
    let data: LeagueDataClass?
}

// MARK: - League Dataclass
struct LeagueDataClass:Codable {
    let resource: String?
    let id: Int?
    let season_id: Int?
    let country_id: Int?
    let name: String?
    let code: String?
    let image_path: String?
    let type: String?
    let updated_at: Date?
}

