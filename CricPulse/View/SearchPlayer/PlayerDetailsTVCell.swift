

import UIKit

class PlayerDetailsTVCell: UITableViewCell {
    @IBOutlet weak var format: UILabel!
    @IBOutlet weak var t20: UILabel!
    @IBOutlet weak var t20i: UILabel!
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var odi: UILabel!
    
    func setupCell(indexpath: IndexPath, stats: PlayerStats){
        let t20 = stats.t20Stats
        let t20i = stats.t20iStats
        let odi = stats.odiStats
        let test = stats.testStats
        
        if indexpath.section == 0{
            setupBattingScores(indexpath, t20, t20i, test, odi)
        }else{
            setupBowlingScores(indexpath, t20, t20i, test, odi)
        }
    }
    
    // MARK: - Batting Score setup
  
    fileprivate func setupBattingScores(_ indexpath: IndexPath, _ t20: Career?, _ t20i: Career?, _ test: Career?, _ odi: Career?) {
        if indexpath.row == 0{
            self.format.text = "Matches"
            self.t20.text = "\(t20?.batting?.matches ?? 0)"
            self.t20i.text = "\(t20i?.batting?.matches ?? 0)"
            self.test.text = "\(test?.batting?.matches ?? 0)"
            self.odi.text = "\(odi?.batting?.matches ?? 0)"
        } else if indexpath.row == 1{
            self.format.text = "Runs"
            self.t20.text = "\(t20?.batting?.runs_scored ?? 0)"
            self.t20i.text = "\(t20i?.batting?.runs_scored ?? 0)"
            self.test.text = "\(test?.batting?.runs_scored ?? 0)"
            self.odi.text = "\(odi?.batting?.runs_scored ?? 0)"
        } else if indexpath.row == 2{
            self.format.text = "Innings"
            self.t20.text = "\(t20?.batting?.innings ?? 0)"
            self.t20i.text = "\(t20i?.batting?.innings ?? 0)"
            self.test.text = "\(test?.batting?.innings ?? 0)"
            self.odi.text = "\(odi?.batting?.innings ?? 0)"
        }else if indexpath.row == 3{
            self.format.text = "Balls"
            self.t20.text = "\(t20?.batting?.balls_faced ?? 0)"
            self.t20i.text = "\(t20i?.batting?.balls_faced ?? 0)"
            self.test.text = "\(test?.batting?.balls_faced ?? 0)"
            self.odi.text = "\(odi?.batting?.balls_faced ?? 0)"
        }else if indexpath.row == 4{
            
            self.format.text = "Average"
            self.t20.text = String(format: "%.1f", t20?.batting?.average ?? 0)
            self.t20i.text = String(format: "%.1f", t20i?.batting?.average ?? 0)
            self.test.text = String(format: "%.1f", test?.batting?.average ?? 0)
            self.odi.text = String(format: "%.1f", odi?.batting?.average ?? 0)
        } else{
            self.format.text = "Strike Rate"
            self.t20.text = String(format: "%.1f", t20?.batting?.strike_rate ?? 0)
            self.t20i.text = String(format: "%.1f", t20i?.batting?.strike_rate ?? 0)
            self.test.text = String(format: "%.1f", test?.batting?.strike_rate ?? 0)
            self.odi.text = String(format: "%.1f", odi?.batting?.strike_rate ?? 0)
        }
    }
    
    // MARK: - Bowling Score setup
    fileprivate func setupBowlingScores(_ indexpath: IndexPath, _ t20: Career?, _ t20i: Career?, _ test: Career?, _ odi: Career?) {
        if indexpath.row == 0{
            self.format.text = "Matches"
            self.t20.text = "\(t20?.bowling?.matches ?? 0)"
            self.t20i.text = "\(t20i?.bowling?.matches ?? 0)"
            self.test.text = "\(test?.bowling?.matches ?? 0)"
            self.odi.text = "\(odi?.bowling?.matches ?? 0)"
        } else if indexpath.row == 1{
            self.format.text = "Runs"
            self.t20.text = "\(t20?.bowling?.runs ?? 0)"
            self.t20i.text = "\(t20i?.bowling?.runs ?? 0)"
            self.test.text = "\(test?.bowling?.runs ?? 0)"
            self.odi.text = "\(odi?.bowling?.runs ?? 0)"
        } else if indexpath.row == 2{
            self.format.text = "Innings"
            self.t20.text = "\(t20?.bowling?.innings ?? 0)"
            self.t20i.text = "\(t20i?.bowling?.innings ?? 0)"
            self.test.text = "\(test?.bowling?.innings ?? 0)"
            self.odi.text = "\(odi?.bowling?.innings ?? 0)"
        }else if indexpath.row == 3{
            self.format.text = "Wickets"
            self.t20.text = "\(t20?.bowling?.wickets ?? 0)"
            self.t20i.text = "\(t20i?.bowling?.wickets ?? 0)"
            self.test.text = "\(test?.bowling?.wickets ?? 0)"
            self.odi.text = "\(odi?.bowling?.wickets ?? 0)"
        }else if indexpath.row == 4{
            
            self.format.text = "Overs"
            self.t20.text = String(format: "%.1f", t20?.bowling?.overs ?? 0)
            self.t20i.text = String(format: "%.1f", t20i?.bowling?.overs ?? 0)
            self.test.text = String(format: "%.1f", test?.bowling?.overs ?? 0)
            self.odi.text = String(format: "%.1f", odi?.bowling?.overs ?? 0)
        } else{
            self.format.text = "Economy Rate"
            self.t20.text = String(format: "%.1f", t20?.bowling?.econ_rate ?? 0)
            self.t20i.text = String(format: "%.1f", t20i?.bowling?.econ_rate ?? 0)
            self.test.text = String(format: "%.1f", test?.bowling?.econ_rate ?? 0)
            self.odi.text = String(format: "%.1f", odi?.bowling?.econ_rate ?? 0)
        }
    }
   
}
