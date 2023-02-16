import Foundation

class UrlGenerator{
  
    
        let baseURL = "https://cricket.sportmonks.com/api/v2.0"
    let apiToken: String = NetworkConstants.shared.apiKey
        static let shared = UrlGenerator()

        private init() {}
    
    /// Create Single Player URL
    /// - Parameter playerID: Recieves player_id
    /// - Returns: URL String
        func createPlayerUrl(playerID: Int) -> URL? {
            let endpoint = "/players/\(playerID)"
            let queryItems = [URLQueryItem(name: "api_token", value: apiToken)]
            return createURL(endpoint: endpoint, queryItems: queryItems)
        }
    
    /// Create all players endpoint URL
    /// - Returns: URL String
        func createPlayersUrl() -> URL? {
            let endpoint = "/players"
            let queryItems = [
                URLQueryItem(name: "fields[players]", value: "fullname,image_path"),
                URLQueryItem(name: "api_token", value: apiToken)
            ]
            return createURL(endpoint: endpoint, queryItems: queryItems)
        }
    
    /// Create Fixtures endpoints URL
    /// - Returns: URL String
        func createFixturesUrl() -> URL? {
            let endpoint = "/fixtures"
            let queryItems = [
                URLQueryItem(name: "include", value: "localteam,visitorteam"),
                URLQueryItem(name: "api_token", value: apiToken)
            ]
            return createURL(endpoint: endpoint, queryItems: queryItems)
        }

        private func createURL(endpoint: String, queryItems: [URLQueryItem]) -> URL? {
            var components = URLComponents(string: baseURL + endpoint)
            components?.queryItems = queryItems
            return components?.url
        }
}
