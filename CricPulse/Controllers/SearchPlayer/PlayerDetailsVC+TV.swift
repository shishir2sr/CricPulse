
import Foundation
import UIKit

extension PlayerDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    // TableView Setup
    func setupTableView(){
        self.playerDetailsTableView.delegate = self
        self.playerDetailsTableView.dataSource = self
        xibRegistration()
        
    }
    
    // xib registration
     func xibRegistration() {
        playerDetailsTableView.register(viewModel.registerCellXib(), forCellReuseIdentifier: Constants.playerDetailsTVCell)
        
        playerDetailsTableView.register(viewModel.registerHeaderXib(), forHeaderFooterViewReuseIdentifier: Constants.headerForPlayerDetails)
    }
    
    // MARK: - Data source and delegate methods
    
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    
    // Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    // tableview header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = playerDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerForPlayerDetails) as? HeaderForPlayerDetails
        guard let header = header else {return UIView()}
        
        return header
    }
    // heaig for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    
    // Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerDetailsTableView.dequeueReusableCell(withIdentifier: Constants.playerDetailsTVCell, for: indexPath) as? PlayerDetailsTVCell
        guard let cell = cell else {return UITableViewCell()}
        cell.format.text = "Nothing"
        cell.selectionStyle = .none
        return cell
    }
    
    // Height for row at
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
