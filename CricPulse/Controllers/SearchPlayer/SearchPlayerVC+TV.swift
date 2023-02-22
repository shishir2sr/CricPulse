import Foundation
import UIKit

extension SearchPlayerViewController: UITableViewDelegate, UITableViewDataSource{
    // Tableview configuration
    func setupTableView(){
        playersTableView.dataSource = self
        playersTableView.delegate = self
    }
    
    // number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchPlayerViewModel.numberOfRows(in: section)
    }
    // tableview cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}
