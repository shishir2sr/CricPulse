
import Foundation
import UIKit

extension DetailedScoreViewController{
    
    func setupTableView(){
        matchDetailsTableView.dataSource = self
        matchDetailsTableView.delegate = self
        registerTableViewCell()
        
    }
    // Register cells
    func registerTableViewCell(){
        matchDetailsTableView.register(FinishedMatchScoreCardTVModel.register(), forCellReuseIdentifier: FinishedMatchScoreCardTVModel.identifier)
        matchDetailsTableView.register(DetailedScoreViewModel.register(), forCellReuseIdentifier: DetailedScoreViewModel.identifier)
    }
    
    
}

// MARK: - Tableview Delegate and datasource
extension DetailedScoreViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    // MARK: Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchDetailsTableView.dequeueReusableCell(withIdentifier: DetailedScoreViewModel.identifier, for: indexPath) as? DetailedScoreTViewCell
        guard let cell  = cell else{return UITableViewCell()}
        return cell
    }
}
