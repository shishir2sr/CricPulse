import Foundation

class EndPoint {
    let baseURL = "https://cricket.sportmonks.com/api/v2.0"
    let apiToken: String = NetworkConstants.shared.apiKey
    static let shared = EndPoint()

    private init() {}

    // Enum for specifying query parameters
    enum QueryParameter {
        case sort(String)
        case include(String)
        case fields(object: String, parameters: String)
        case fileter(name: String, values: String)

        var queryItem: URLQueryItem {
            switch self {
            case .sort(let value):
                return URLQueryItem(name: "sort", value: value)
            case .include(let value):
                return URLQueryItem(name: "include", value: value)
            case .fields(let object, let value):
                return URLQueryItem(name: "fields[\(object)]", value: value)
            case .fileter(let name, let values):
                return URLQueryItem(name: "filter[\(name)]", value: values)
            }
        }
    }

    private func createURL(endpoint: String, queryParameters: [QueryParameter]) -> URL? {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = queryParameters.map { $0.queryItem }
        components?.queryItems?.append(URLQueryItem(name: "api_token", value: apiToken))
        return components?.url
    }

    // Create Single Player URL
    func getPlayer(ID playerID: Int, with queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/players/\(playerID)"
        return createURL(endpoint: endpoint, queryParameters: queryParameters)
    }

    // Create all players endpoint URL
    func getPlayers(with queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/players"
        return createURL(endpoint: endpoint, queryParameters: queryParameters)
    }

    // Create Fixtures endpoints URL
    func getFixtures(with queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/fixtures"
        return createURL(endpoint: endpoint, queryParameters: queryParameters)
    }
    // Create Fixtures With Id
    func getFixture(Id fixtureId : Int, with queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/fixtures/\(fixtureId)"
        return createURL(endpoint: endpoint, queryParameters: queryParameters)
    }
}



/**
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

*/

