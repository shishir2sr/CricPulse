
import Foundation
import UIKit

extension DetailedScoreViewController{
    
    func setupTableView(){
        matchDetailsTableView.dataSource = self
        matchDetailsTableView.delegate = self
        
        let insets = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
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
        
        if let battingScore = battingScore, let bowlingScore = bowlingScore{
            switch section{
            case 0:
                return battingScore.count
            case 1:
                return bowlingScore.count
            default:
                return 5
            }
        }
        return 5
    }
    
    // MARK: Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchDetailsTableView.dequeueReusableCell(withIdentifier: DetailedScoreViewModel.cellIdentifier, for: indexPath) as? DetailedScoreTViewCell
        
        guard let cell  = cell else{return UITableViewCell()}
        guard let battingScore = battingScore else{return UITableViewCell()}
        guard let bowlingScore = bowlingScore else {return UITableViewCell()}
        
        if indexPath.section == 0{
            let battingScore = battingScore[indexPath.row]
            cell.playerName.text = battingScore.batsman?.fullname
            cell.playersPosition.text = battingScore.batsman?.position?.name
            cell.ball.text = "\(battingScore.ball ?? 5)"
            cell.fours.text = "\(battingScore.four_x ?? 0)"
            cell.run.text = "\(battingScore.score ?? 0)"
            cell.sixes.text = "\(battingScore.six_x ?? 0)"
            cell.strikeRate.text = "\(battingScore.rate ?? 0)"
        }else if indexPath.section == 1{
            let bowlingScore = bowlingScore[indexPath.row]
            cell.playerName.text = bowlingScore.bowler?.fullname
            cell.playersPosition.text = bowlingScore.bowler?.position?.name
            cell.run.text = "\(bowlingScore.overs ?? 0)"
            cell.ball.text = "\(bowlingScore.medians ?? 0)"
            cell.fours.text = "\(bowlingScore.runs ?? 0)"
            cell.sixes.text = "\(bowlingScore.wide ?? 0)"
            cell.strikeRate.text = "\(bowlingScore.rate ?? 0)"
        }
        
        
        return cell
    }
    
    // Row Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    // MARK: Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let header = matchDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForBattersCell") as? HeaderForBattersCell
            guard let header = header else{ return nil}
            
            header.role.text = "Batter"
            header.firstScore.text = "R"
            header.secondScore.text = "B"
            header.thirdScore.text = "4s"
            header.fourthScore.text = "6s"
            header.fifthScore.text = "S/R"
            
            return header
        }else{
            let header = matchDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForBattersCell") as? HeaderForBattersCell
            guard let header = header else{ return nil}
            
            header.role.text = "Bowler"
            header.firstScore.text = "O"
            header.secondScore.text = "M"
            header.thirdScore.text = "R"
            header.fourthScore.text = "W"
            header.fifthScore.text = "Eco"
            return header
        }
        
       
    }
    // height for header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      60
    }
    
    // MARK: Footer
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 0 {
//            let footer = matchDetailsTableView.dequeueReusableHeaderFooterView(withIdentifier: "FooterForBattersCell") as? FooterForBattersCell
//            guard let footer = footer else{ return nil}
//            return footer
//        }else {
//            return nil
//        }
//
//    }
//    // Footer height
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        70
//    }
    
    
    
}


