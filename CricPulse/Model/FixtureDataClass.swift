import Foundation

struct Fixtures: Codable {
    let data: [FixtureDataClass]
    let links: Links?
    let meta: Meta?
}

struct Fixture:Codable {
    let data: FixtureDataClass
}

struct FixtureDataClass: Codable {
    let resource: String?
       let id, league_id, season_id, stage_id: Int?
       let round: String?
       let localteam_id, visitorteam_id: Int?
       let starting_at: Date?
       let type: String?
       let live: Bool?
//       let status: String?
       let status: Status?
       let last_period: String?
       let note: String?
       let venue_id: Int?
       let toss_won_team_id, winner_team_id: Int?
       let draw_noresult: String?
       let first_umpire_id: Int?
       let second_umpire_id, tv_umpire_id: Int?
       let referee_id: Int?
       let man_of_match_id: Int?
       let man_of_series_id: Int?
       let total_overs_played: Double?
       let elected: String?
       let super_over, follow_on: Bool?
       let localteam_dl_data, visitorteam_dl_data: TeamDLData?
       let rpc_overs, rpc_target: String?
       let localteam, visitorteam: Team?
       let league: LeagueDataClass?
    let venue: VenueDataClass?
}

enum Status: String, Codable {
    case aban = "Aban."
    case finished = "Finished"
    case ns = "NS"
    case the1StInnings = "1st Innings"
    case the2NdInnings = "2nd Innings"
    
    var statusText: String{
        switch self{
        case .finished:
            return "Finished"
        case .ns:
            return "Upcoming"
        case .aban:
            return "Postponded"
        case .the1StInnings:
            return "Live"
        case .the2NdInnings:
            return "live"
        default:
            return "Unknown"
        }
    }
}

struct TeamDLData: Codable {
    let score: String?
    let overs: String?
    let wicketsOut: String?
    let totalOversPlayed: String?
}

struct Links: Codable {
    let first, last: String?
    let prev: String?
    let next: String?
}

struct Meta: Codable {
    let currentPage, from, lastPage: Int?
    let links: [Link]?
    let path: String?
    let perPage, to, total: Int?
}

struct Link: Codable {
    let url: String?
    let label: String?
    let active: Bool?
}



