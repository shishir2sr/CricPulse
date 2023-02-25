import Foundation

class FixtureViewModel{
    
    private let remoteFixtureRepository : RemoteFixtureRepository
    var dataSource: [FixtureDataClass] = []
    @Published var isLoading: Bool = false
    @Published var fixtureData: [FinishedMatchScoreCardTVModel] = []
  
    init(remoteFixtureRepository: RemoteFixtureRepository = RemoteFixtureRepository()) {
        self.remoteFixtureRepository = remoteFixtureRepository
    }
    
    func numberOfRows(in section: Int) -> Int{
        return fixtureData.count
    }
    
    func formatDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let myDate = date
        let dateString = dateFormatter.string(from: myDate)
        return dateString
    }
    
    func getFixtures(for url: URL?)async {
        guard let url = url else{return}
        let data: Result<Fixtures,CustomError> = await remoteFixtureRepository.getFixtures(url: url)
        switch data {
        case .success(let fixtures):
            self.dataSource = fixtures.data
            self.mapData()
        case .failure(let failure):
            print(failure.localizedDescription)
            print(failure)
            // TODO: UI change
        }
    }
    
    func mapData(){
        self.fixtureData = dataSource.compactMap { fixture in
            return FinishedMatchScoreCardTVModel(scorecard: fixture)
        }
    }
    
    
}
