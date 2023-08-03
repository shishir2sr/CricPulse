import Foundation
class NetworkConstants {
    static var shared = NetworkConstants()
    private init() {}

    var apiKey: String {
        return "yvgudQHa0QoMqxkqcFUGT3Ux5KC2z6SEVBixIJU0PGyN2gCgC9lzK2H5fUY9"
    }

    var apiEndPoint: String {
        return "https://cricket.sportmonks.com/api/v2.0/fixtures"
    }
}

