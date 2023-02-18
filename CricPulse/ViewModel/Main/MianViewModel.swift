import Foundation

class MainViewModel{
    // Combined variables
    @Published var isLoading: Bool = false
    @Published var scoreCardForCV:[ScoreCardCVModel] = []
    @Published var scoreCardForTV:[FinishedMatchScoreCardTVModel] = []
    
    // Variables
    var dataSource: [FixtureDataClass] = []
    
    // CollectionView Number of items
    func numberOfItems(in _: Int) -> Int {
        return scoreCardForCV.count
    }
    
    // TableView Number of rows
    func numberOfRows(in _: Int) -> Int {
        return scoreCardForTV.count
    }
    
    // Get Data
    func getFixture()async {
        // Generate URL
        let includeString = "localteam,visitorteam,league,venue,runs.team"
        let url = EndPoint.shared.getFixtures(with: [.include(includeString),.sort("-updated_at")])
        // get data
        let data: Result<Fixtures,CustomError> = await ApiClient.shared.fetchData(url: url)
        handleResponse(data: data)
    }
    
    // Handle Data
    func handleResponse(data: Result<Fixtures,CustomError>){
        switch data{
        case .success(let score):
            self.dataSource = score.data
            mapData()
            debugPrint(score.data[0].note!)
        case .failure(let err):
            debugPrint(err.localizedDescription) // TODO: Do something to the UI
        }
    }
    
    // Match Result
    static func getScore(for team: Int, dataClass: FixtureDataClass) -> String{
        let team = dataClass.runs?[team]
        let score = team?.score
        let wickets = team?.wickets
        let overs = team?.overs
        if let score = score, let wickets = wickets, let overs = overs {
            return "\(score)/\(wickets) (\(overs))"
        }else{
            return "---"
        }
    }
    
    // Map Fetched data into viewmodel
    func mapData(){
        // Upcoming and Live Match data
        let upComingMatchData = dataSource.filter {$0.status != .finished && $0.status != .aban}
        self.scoreCardForCV = upComingMatchData.compactMap{ScoreCardCVModel(scorecard: $0)}
        
        // Finished Match Data
        let finishedMatchData = dataSource.filter {$0.status == .finished}
        self.scoreCardForTV = finishedMatchData.compactMap { scorecard in
            return FinishedMatchScoreCardTVModel(scorecard: scorecard)
        }
    }
}
