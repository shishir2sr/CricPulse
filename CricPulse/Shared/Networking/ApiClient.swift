import Foundation

class ApiClient{
    static let shared = ApiClient()
    private init() {}
    func fetchData<T: Decodable>(url: URL?) async -> Result<T, Error> {
        guard let url = url else {
            return .failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil))
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let resource = try JSONDecoder().decode(T.self, from: data)
            print("Decode Successful")
            return .success(resource)
        } catch {
            return .failure(error)
        }
    }
}
