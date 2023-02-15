import Foundation

class MainViewModel{
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
        let url = UrlGenerator.shared.getFixturesURL()
        
        let data: Result<Fixtures,Error> = await ApiClient.shared.fetchData(url: url)
        print(data)
    }
}
