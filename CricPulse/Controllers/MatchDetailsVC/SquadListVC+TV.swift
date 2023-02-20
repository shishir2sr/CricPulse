import Foundation
import UIKit

extension SquadListViewController: UITableViewDataSource, UITableViewDelegate{
    //
    func setupSquadTableVIew(){
        squadListTableView.dataSource = self
        squadListTableView.delegate = self

        registerSquadTV()
    }
    
    //
    func registerSquadTV(){
        squadListTableView.register(UINib(nibName: Constants.squadListTableViewIdentifier, bundle: nil), forCellReuseIdentifier: Constants.squadListTableViewIdentifier)
    }
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    // Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = squadListTableView.dequeueReusableCell(withIdentifier: "SquadListTableViewCell") as? SquadListTableViewCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    // height for row at
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}

