
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
    
    // Reload TableData
    func realoadTableData(){
        DispatchQueue.main.async {
            self.playerDetailsTableView.reloadData()
        }
    }
    
    // MARK: - Data source and delegate methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = playerDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerForPlayerDetails) as? HeaderForPlayerDetails
        guard let header = header else {return UIView()}
        
        if section == 0{
            header.format.text = "Batting"
        }else{
            header.format.text = "Bowling"
        }
        header.headerBackView.round(5)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerDetailsTableView.dequeueReusableCell(withIdentifier: Constants.playerDetailsTVCell, for: indexPath) as? PlayerDetailsTVCell
        
        guard let cell = cell else {return UITableViewCell()}
        
        if let playersStat = playersStat{
            cell.setupCell(indexpath: indexPath, stats: playersStat)
            cell.selectionStyle = .none
            return cell
        }else
        {
            return UITableViewCell()
        }
    }
 
    
    // MARK: - Scroll animation
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UITableView{
            if scrollView.contentOffset.y > 35 {
                upScrollAnimation()
            }else if scrollView.contentOffset.y < 0 {
                downScrollAnimation()
            }
            
        }
    }
    
    // upscroll
    fileprivate func upScrollAnimation() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.backViewHeight.constant = 0
            
            self?.playerImage.alpha = 0
            self?.playerImageHeight.constant = 0
            self?.playerName.isHidden = true
            self?.countryName.isHidden = true
            self?.view.layoutIfNeeded()
        }
    }
    
    // Downscroll
    fileprivate func downScrollAnimation() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.backViewHeight.constant = 180
            
            self?.playerImage.alpha = 1
            self?.playerImageHeight.constant = 80
            self?.playerName.isHidden = false
            self?.countryName.isHidden = false
            self?.view.layoutIfNeeded()
        }
    }
}
