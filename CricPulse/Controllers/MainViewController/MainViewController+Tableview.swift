import Foundation
import UIKit

extension ViewController{
    // TableView stup
    func setupTableView(){
        homeTableView.dataSource = self
        homeTableView.delegate = self
        registerTableViewCell()
        homeTableView.addShadow(opecity: 0.6, size: 1, radius: 1, color: UIColor.gray)
//       
//        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        homeTableView.contentInset = insets
        

    }
    
    //cell Registration
    func registerTableViewCell(){
        homeTableView.register(FinishedMatchScoreCardTVModel.register(), forCellReuseIdentifier: FinishedMatchScoreCardTVModel.identifier)
    }
    
    // TableView Reload
    func reloadTableView(){
        DispatchQueue.main.async {
            self.homeTableView.reloadData()
        }
    }
}


// MARK: - Tableview Data Source and Delegate

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.numberOfRows(in: section)
    }
    // TableView Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: FinishedMatchScoreCardTVModel.identifier, for: indexPath) as? HomeTableViewCell else{
            return UITableViewCell()
        }
        cell.setupCell(viewModel: self.tableViewData[indexPath.row])
        return cell
    }
    // Tableview Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        145
    }
    
    
}
