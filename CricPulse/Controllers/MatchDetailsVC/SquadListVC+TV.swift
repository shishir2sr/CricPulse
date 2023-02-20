import Foundation
import UIKit

extension SquadListViewController: UITableViewDataSource, UITableViewDelegate{
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    //
    func setupSquadTableVIew(){
        squadListTableView.dataSource = self
        squadListTableView.delegate = self
        squadListTableView.addShadow(opecity: 0.6, size: 1, radius: 1, color: UIColor.gray)
        registerSquadTV()
    }
    
    //
    func registerSquadTV(){
        squadListTableView.register(UINib(nibName: Constants.squadListTableViewIdentifier, bundle: nil), forCellReuseIdentifier: Constants.squadListTableViewIdentifier)
        
        squadListTableView.register(UINib(nibName: Constants.HeaderForSquadList, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.HeaderForSquadList)
    }
    
    // Header for section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = squadListTableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.HeaderForSquadList) as? HeaderForSquadList
        guard let header = header else {return UIView()}
        return header
    }
    
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
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

