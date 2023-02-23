import Foundation
import UIKit

extension SearchPlayerViewController: UITableViewDelegate, UITableViewDataSource{
    // Tableview configuration
    func setupTableView(){
        playersTableView.dataSource = self
        playersTableView.delegate = self
        registerCell()
        playersTableView.backgroundColor = .clear
    }
    
    // register cells
    func registerCell(){
        playersTableView.register(searchPlayerViewModel.registerNib(), forCellReuseIdentifier: Constants.searchPlayerTVCell)
    }
    
    // MARK: Ddelegate and data source functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchPlayerViewModel.numberOfRows(in: section)
    }
    // tableview cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: Constants.searchPlayerTVCell, for: indexPath) as? SearchPlayerTVCell
        guard let cell = cell else {return UITableViewCell()}
        cell.selectionStyle = .none
        return cell
    }
    // tableview height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
}
