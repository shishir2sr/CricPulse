
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
        matchDetailsTableView.register(DetailedScoreViewModel.registerCellsXib(), forCellReuseIdentifier: DetailedScoreViewModel.cellIdentifier)
        
        matchDetailsTableView.register(DetailedScoreViewModel.registerBattersHeaderXib(), forHeaderFooterViewReuseIdentifier: "HeaderForBattersCell")
        
        matchDetailsTableView.register(DetailedScoreViewModel.registerBattersFooterXib(), forHeaderFooterViewReuseIdentifier: "FooterForBattersCell")
    }
    
    
}

// MARK: - Tableview Delegate and datasource
extension DetailedScoreViewController: UITableViewDelegate, UITableViewDataSource{
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return viewmodel.numberOfRows(in: section)
        }else{
            return viewmodel.numberOfRows(in: section)
        }
    }
    
    // MARK: Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchDetailsTableView.dequeueReusableCell(withIdentifier: DetailedScoreViewModel.cellIdentifier, for: indexPath) as? DetailedScoreTViewCell
        guard let cell  = cell else{return UITableViewCell()}
        return cell
    }
    
    // Row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    // MARK: Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = matchDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForBattersCell") as! HeaderForBattersCell
        return header
    }
    // height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      60
    }
    
    // MARK: Footer
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let footer = matchDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterForBattersCell") as? FooterForBattersCell
            guard let footer = footer else{ return UIView()}
            return footer
        }else {
            return nil
        }
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        70
    }
    
    
    
}


