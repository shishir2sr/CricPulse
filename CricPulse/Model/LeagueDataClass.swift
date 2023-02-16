import Foundation

struct League {
    let data: LeagueDataClass?
}
struct LeagueDataClass:Codable {
    let resource: String?
    let id: Int?
    let seasonID: Int?
    let countryID: Int?
    let name: String?
    let code: String?
    let imagePath: String?
    let type: String?
    let updatedAt: String?
}
