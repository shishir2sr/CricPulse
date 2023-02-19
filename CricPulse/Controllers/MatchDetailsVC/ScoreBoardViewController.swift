
import UIKit

class ScoreBoardViewController: UIViewController {
    @IBOutlet weak var teamOneBackgroundVIew: UIView!
    @IBOutlet weak var teamTwoBackgroundVIew: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamOneBackgroundVIew.addBorder(color: .systemGray5, width: 0.5)
        teamOneBackgroundVIew.round(10)
        teamTwoBackgroundVIew.addBorder(color: .systemGray5, width: 1)
        teamTwoBackgroundVIew.round(10)
    }
    

}
