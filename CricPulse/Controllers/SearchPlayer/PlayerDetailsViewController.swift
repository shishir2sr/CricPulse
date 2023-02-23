

import UIKit

class PlayerDetailsViewController: UIViewController {
    // views
    @IBOutlet weak var backView: UIView!
    
    // tableview
    @IBOutlet weak var playerDetailsTableView: UITableView!
    // Outlets
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
   
    }
    
    func setupView(){
        
    }

}
