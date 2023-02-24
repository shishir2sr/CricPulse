
import Foundation
import UIKit

extension PlayerDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    // TableView Setup
    func setupTableView(){
        self.playerDetailsTableView.delegate = self
        self.playerDetailsTableView.dataSource = self
        playerDetailsTableView.register(viewModel.registerNib(), forCellReuseIdentifier: Constants.playerDetailsTVCell)
    }
    
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    // Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerDetailsTableView.dequeueReusableCell(withIdentifier: Constants.playerDetailsTVCell, for: indexPath) as? PlayerDetailsTVCell
        guard let cell = cell else {return UITableViewCell()}
        cell.format.text = "Nothing"
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
