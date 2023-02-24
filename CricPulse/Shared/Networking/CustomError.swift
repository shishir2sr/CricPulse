import Foundation

enum CustomError: Error {
    case invalidURL
    case invalidData
    case unableToComplete
    case invalidResponse
    var localizedDescription: String {
        switch self {
        case .invalidURL: return "Request failed!"
        case .invalidData: return "The data retrieved from the server is invalid. Please try again later."
        case .unableToComplete: return "Unable to complete your request at this time. Please check your internet connection and try again."
        case .invalidResponse: return "The server is currently unavailable. Please try again later"
        }
    }
}


