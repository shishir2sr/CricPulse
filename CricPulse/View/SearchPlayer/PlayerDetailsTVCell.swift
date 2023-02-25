

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
    }
   
}
