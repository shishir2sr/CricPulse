import Foundation

class ApiClient{

    static let shared = ApiClient()

    private init() {}
    func fetchData<T: Decodable>(url: URL?) async -> Result<T, CustomError> {
        // Check if url is valid or not
        guard let url = url else {
            return .failure(.invalidURL)
        }
        do {

            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                return .failure(.invalidResponse)
            }

            // Date Formatter
            let dateFormatter = DateFormatter()
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

            // Decoder
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            let resource = try decoder.decode(T.self, from: data)
            print("Decode Successful")
            return .success(resource)
        } catch {
            debugPrint(error)
            return .failure(.unableToComplete)
        }
    }
}

//class ApiClient {
//    static let shared = ApiManager()
//    private let cache = NSCache<NSString, NSData>()
//    private init() {}
//
//    func fetchDataFromApi<T: Decodable>(url: URL?) async -> Result<T, Error> {
//        guard let url = url else {
//            return .failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
//        }
//
//        if let cachedData = cache.object(forKey: url.absoluteString as NSString) as? Data {
//            do {
//                let resource = try JSONDecoder().decode(T.self, from: cachedData)
//                print("Decode Successful (Cached)")
//                return .success(resource)
//            } catch {
//                print("Error decoding cached data: \(error)")
//            }
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let resource = try JSONDecoder().decode(T.self, from: data)
//            print("Decode Successful (Network)")
//
//            cache.setObject(data as NSData, forKey: url.absoluteString as NSString)
//
//            return .success(resource)
//        } catch {
//            return .failure(error)
//        }
//    }
//}
