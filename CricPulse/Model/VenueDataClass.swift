import Foundation

struct Venues: Codable {
    let data: [VenueDataClass]?
}

struct VenueDataClass: Codable{
    let resource: String?
    let id: Int?
    let country_id: Int?
    let name: String?
    let city: String?
    let image_path: String?
    let capacity: Int?
    let floodlight: Bool?
}
