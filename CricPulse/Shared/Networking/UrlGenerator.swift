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


// MARK: - Testing if working or not

class UrlGenerator2 {
    let baseURL = "https://cricket.sportmonks.com/api/v2.0"
    let apiToken: String = NetworkConstants.shared.apiKey
    static let shared = UrlGenerator2()

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

    private func createURL(endpoint: String, queryParameters: [URLQueryItem]) -> URL? {
        var components = URLComponents(string: baseURL + endpoint)
        components?.queryItems = queryParameters.map { $0 }
        components?.queryItems?.append(URLQueryItem(name: "api_token", value: apiToken))
        return components?.url
    }

    // Create Single Player URL
    func createPlayerUrl(playerID: Int, queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/players/\(playerID)"
        var defaultQueryParameters: [URLQueryItem] = []
        for urlQueryItem in queryParameters{
            defaultQueryParameters.append(urlQueryItem.queryItem)
        }
        return createURL(endpoint: endpoint, queryParameters: defaultQueryParameters)
    }

    // Create all players endpoint URL
    func createPlayersUrl(queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/players"
        var defaultQueryParameters: [URLQueryItem] = []
        for urlQueryItem in queryParameters{
            defaultQueryParameters.append(urlQueryItem.queryItem)
        }
        return createURL(endpoint: endpoint, queryParameters: defaultQueryParameters)
    }

    // Create Fixtures endpoints URL
    func createFixturesUrl(queryParameters: [QueryParameter] = []) -> URL? {
        let endpoint = "/fixtures"
        var defaultQueryParameters: [URLQueryItem] = []
        for urlQueryItem in queryParameters{
            defaultQueryParameters.append(urlQueryItem.queryItem)
        }
        return createURL(endpoint: endpoint, queryParameters: defaultQueryParameters)
    }
}


/**
 let urlGenerator = UrlGenerator.shared

 let playerUrl = urlGenerator.createPlayerUrl(playerID: 123, queryParameters: [
     .sort("created_at"),
     .fields(["fixtures.id", "fixtures.name", "fixtures.created_at"])
 ])

 let playersUrl = urlGenerator.createPlayersUrl(queryParameters: [
     .sort("fullname"),
     .fields(["players.fullname", "players.image_path"])
 ])

 let fixturesUrl = urlGenerator.createFixturesUrl(queryParameters: [
     .sort("id"),
     .fields(["fixtures.id", "fixtures.name", "fixtures.created_at"])
 ])
 */

