import Foundation

class MainViewModel{
    // Combined variables
    @Published var isLoading: Bool = false
    @Published var fixtures:[ScoreBoardCollectionViewModel] = []
    
    // Variables
    var dataSource: [FixtureDataClass] = []
    
    // CollectionView Number of items
    func numberOfItems(in _: Int) -> Int {
        return fixtures.count
    }
    // TableViewNumber of rows
    func numberOfRows(in _: Int) -> Int {
        return 10
    }
    
    // Get Data
    func getFixture()async {
        let url = UrlGenerator.shared.createFixturesUrl()
        let data: Result<Fixtures,CustomError> = await ApiClient.shared.fetchData(url: url)
        print(data)
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
    // Map Fetched data into viewmodel
    func mapData(){
        fixtures = dataSource.compactMap{ScoreBoardCollectionViewModel(scorecard: $0)}
    }
}
