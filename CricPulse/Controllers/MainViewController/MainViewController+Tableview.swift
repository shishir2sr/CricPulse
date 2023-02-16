import Foundation
import UIKit

extension ViewController{
    // TableView stup
    func setupTableView(){
        homeTableView.dataSource = self
        homeTableView.delegate = self
        registerTableViewCell()
        homeTableView.addShadow(opecity: 0.7, size: 2, radius: 2, color: UIColor.gray)
    }
    
    func registerTableViewCell(){
        homeTableView.register(HomeTableCellViewModel.register(), forCellReuseIdentifier: HomeTableCellViewModel.identifier)
    }
}

// MARK: - Tableview Data Source and Delegate
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.numberOfRows(in: section)
    }
    // TableView Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeTableCellViewModel.identifier, for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
    // Tableview Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        145
    }
}
