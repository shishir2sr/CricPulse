
import Foundation
import UIKit

extension DetailedScoreViewController{
    
    func setupTableView(){
        matchDetailsTableView.dataSource = self
        matchDetailsTableView.delegate = self
        
    }
    // Register cells
    func registerTableViewCell(){
        homeTableView.register(FinishedMatchScoreCardTVModel.register(), forCellReuseIdentifier: FinishedMatchScoreCardTVModel.identifier)
    }
    
    
}

// MARK: - Tableview Delegate and datasource
extension DetailedScoreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
