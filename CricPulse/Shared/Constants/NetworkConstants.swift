import Foundation
class NetworkConstants {
    static var shared = NetworkConstants()
    private init() {}

    var apiKey: String {
//        return "5NuV3bPUD19jQW1kINP3QwPYqtZPeHKiA55CjjI4QPRLgwAdg6IdfG2N09Ze"
        return "35yQyoB6fmyVaKYZtRzYViuvE5o3p4QYHKStifl4zuav7NrLJIDzTblQcQx6"
    }

    var apiEndPoint: String {
        return "https://cricket.sportmonks.com/api/v2.0/fixtures"
    }
}

