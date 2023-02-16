import Foundation

class MainViewModel{
    // Variables
    @Published var isLoading: Bool = false
    var dataSource: [FixtureDataClass] = []
    @Published var fixtures:[HomeTableCellViewModel] = []
    // CollectionView Number of items
    func numberOfItems(in _: Int) -> Int {
        return 10
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
        case .success(let data):
            print(data)
        case .failure(let err):
            debugPrint(err.localizedDescription) // TODO: Do something to the UI
        }
    }
}
