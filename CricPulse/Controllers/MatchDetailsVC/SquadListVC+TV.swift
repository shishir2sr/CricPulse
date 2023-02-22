import Foundation
import UIKit

extension SquadListViewController: UITableViewDataSource, UITableViewDelegate{
    //
    func setupSquadTableVIew(){
        squadListTableView.dataSource = self
        squadListTableView.delegate = self
        squadListTableView.addShadow(opecity: 0.6, size: 1, radius: 1, color: UIColor.gray)
        registerSquadTV()
    }
    
    // ReloadTableView
    func realoadTableView(){
        DispatchQueue.main.async {
            self.squadListTableView.reloadData()
        }
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
        
        if section == 0{
            header.teamName.text = self.teamOneName
        }else if section == 1{
            header.teamName.text = self.teamTwoName
        }
       
        return header
    }
    
     // Height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
                return teamOneSquadList.count
            } else if section == 1 {
                return teamTwoSquadList.count
            }
            return 0
    }
    
    // Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = squadListTableView.dequeueReusableCell(withIdentifier: "SquadListTableViewCell") as? SquadListTableViewCell
        guard let cell = cell else {return UITableViewCell()}
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
                let player = teamOneSquadList[indexPath.row]
            cell.playerImage.sd_setImage(with: URL(string: player.image_path ?? ""), placeholderImage: UIImage(systemName: "photo"))
            cell.playersName.text = player.fullname
            } else if indexPath.section == 1 {
                let player = teamTwoSquadList[indexPath.row]
                cell.playerImage.sd_setImage(with: URL(string: player.image_path ?? ""), placeholderImage: UIImage(systemName: "photo"))
                cell.playersName.text = player.fullname
            }
            
            return cell
    }
    
    // height for row at
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}

