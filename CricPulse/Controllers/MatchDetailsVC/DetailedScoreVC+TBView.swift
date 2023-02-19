
import Foundation
import UIKit

extension DetailedScoreViewController{
    
    func setupTableView(){
        matchDetailsTableView.dataSource = self
        matchDetailsTableView.delegate = self
        
        let insets = UIEdgeInsets(top: -35, left: 0, bottom: 0, right: 0)
        matchDetailsTableView.contentInset = insets
        registerTableViewCell()
       
        
    }
    // Register cells
    func registerTableViewCell(){
        matchDetailsTableView.register(DetailedScoreViewModel.registerCellsXib(), forCellReuseIdentifier: DetailedScoreViewModel.identifier)
        
        matchDetailsTableView.register(DetailedScoreViewModel.registerHeaderXib(), forHeaderFooterViewReuseIdentifier: "HeaderForBattersCell")
    }
    
    
}

// MARK: - Tableview Delegate and datasource
extension DetailedScoreViewController: UITableViewDelegate, UITableViewDataSource{
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    // MARK: Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchDetailsTableView.dequeueReusableCell(withIdentifier: DetailedScoreViewModel.identifier, for: indexPath) as? DetailedScoreTViewCell
        guard let cell  = cell else{return UITableViewCell()}
        return cell
    }
    
    // Row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = matchDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForBattersCell") as! HeaderForBattersCell
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      60
    }
}


