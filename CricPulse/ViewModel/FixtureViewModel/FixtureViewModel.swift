import Foundation

class FixtureViewModel{
    func formatDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let myDate = date
        let dateString = dateFormatter.string(from: myDate)
        return dateString
    }
}
