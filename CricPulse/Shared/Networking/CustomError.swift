import Foundation

enum CustomError: Error {
    case invalidURL
    case invalidData
    case unableToComplete
    case invalidResponse
    
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidData: return "Invalid Data"
        case .unableToComplete: return "Unable to complete your request. Internet may not be available"
        case .invalidResponse: return "Invalid api Response"
        }
    }
}
