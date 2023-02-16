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
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601 // set the date decoding strategy to ISO 8601 format
            let resource = try jsonDecoder.decode(T.self, from: data)
            print("Decode Successful")
            return .success(resource)
        } catch {
            return .failure(.unableToComplete)
        }
    }
}
