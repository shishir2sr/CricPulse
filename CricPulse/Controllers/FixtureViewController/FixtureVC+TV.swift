import Foundation
import UIKit

extension FixtureViewController: UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(FinishedMatchScoreCardTVModel.register(), forCellReuseIdentifier: FinishedMatchScoreCardTVModel.identifier)
    }
    
    func reloadTablerView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: FinishedMatchScoreCardTVModel.identifier, for: indexPath) as? HomeTableViewCell
        guard let cell = cell else{return UITableViewCell()}
        cell.setupCell(viewModel: fixtureData[indexPath.row])
        cell.addShadow(opecity: 0.8, size: 1, radius: 2, color: UIColor.gray)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       145
    }
    
    
}
