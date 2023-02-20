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
