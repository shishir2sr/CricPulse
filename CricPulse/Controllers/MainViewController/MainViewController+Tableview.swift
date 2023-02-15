import Foundation
import UIKit

extension ViewController{
    // TableView stup
    func setupTableView(){
        homeTableView.dataSource = self
        homeTableView.delegate = self
        registerTableViewCell()
    }
    
    func registerTableViewCell(){
        homeTableView.register(HomeTableCellViewModel.register(), forCellReuseIdentifier: HomeTableCellViewModel.identifier)
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeTableCellViewModel.identifier, for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
