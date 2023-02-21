import Foundation

class UrlBuilder {
    let baseURL: String
    let apiToken: String
    
    init(baseURL: String, apiToken: String) {
        self.baseURL = baseURL
        self.apiToken = apiToken
    }
    
    class Builder {
        private var baseURL: String = ""
        private var apiToken: String = ""
        private var endpoint: String = ""
        private var queryParameters: [URLQueryItem] = []
        
        func setBaseURL(_ baseURL: String) -> Builder {
            self.baseURL = baseURL
            return self
        }
        
        func setApiToken(_ apiToken: String) -> Builder {
            self.apiToken = apiToken
            return self
        }
        
        func setEndpoint(_ endpoint: String) -> Builder {
            self.endpoint = endpoint
            return self
        }
        
        func addQueryParameter(_ name: String, _ value: String) -> Builder {
            let queryItem = URLQueryItem(name: name, value: value)
            self.queryParameters.append(queryItem)
            return self
        }
        
        func build() -> URL? {
            var components = URLComponents(string: baseURL + endpoint)
            components?.queryItems = queryParameters
            components?.queryItems?.append(URLQueryItem(name: "api_token", value: apiToken))
            return components?.url
        }
    }
}

/**
 let builder =UrlBuilder.Builder()
     .setBaseURL("https://cricket.sportmonks.com/api/v2.0")
     .setApiToken(NetworkConstants.shared.apiKey)
     .setEndpoint("/players")
     .addQueryParameter("sort", "name")
     .addQueryParameter("include", "team")
 let url = builder.build()

 */
