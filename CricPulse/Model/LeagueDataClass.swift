import Foundation

struct League {
    let data: LeagueDataClass?
}
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
/**
 data": {
         "resource": "leagues",
         "id": 9,
         "season_id": 1184,
         "country_id": 155043,
         "name": "Bangladesh Premier League",
         "code": "BPL",
         "image_path": "https://cdn.sportmonks.com/images/cricket/leagues/9/9.png",
         "type": "league",
         "updated_at": "2022-11-05T17:40:18.000000Z"
 */
