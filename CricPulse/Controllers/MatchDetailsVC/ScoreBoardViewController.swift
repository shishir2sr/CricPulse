
import UIKit

class ScoreBoardViewController: UIViewController {
    
    // UIView outlets
    @IBOutlet weak var teamOneBackgroundVIew: UIView!
    @IBOutlet weak var teamTwoBackgroundVIew: UIView!
    
    // Outlets
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamOneFlag: UIImageView!
    
 
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    @IBOutlet weak var teamTwoFlag: UIImageView!
    
    
    // MARK: - View Did load?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    // view did load setup
     func setupView() {
        teamOneBackgroundVIew.addBorder(color: .systemGray4, width: 1)
        teamOneBackgroundVIew.round(10)
        teamOneBackgroundVIew.addShadow(opecity: 0.8, size: 2, radius: 4, color: UIColor.darkGray)
        
        teamTwoBackgroundVIew.addBorder(color: .systemGray4, width: 1)
        teamTwoBackgroundVIew.round(10)
        
        let tapGestureTwo = UITapGestureRecognizer(target: self, action: #selector(viewTwoTapped))
        teamTwoBackgroundVIew.addGestureRecognizer(tapGestureTwo)
        
        let tapGestureOne = UITapGestureRecognizer(target: self, action: #selector(viewOneTapped))
        teamOneBackgroundVIew.addGestureRecognizer(tapGestureOne)
    }
    
    // View One tapped
    @objc func viewOneTapped(){
        buttonGuestureAnimation(for: teamOneBackgroundVIew)
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.detailedScoreBoardForTeamID)  as? DetailedScoreViewController
        viewController?.title = ""
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    // Team two button tap
    @objc func viewTwoTapped(){
        print("button 2 pressed")
        buttonGuestureAnimation(for: teamTwoBackgroundVIew)
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.detailedScoreBoardForTeamID)  as? DetailedScoreViewController
        viewController?.title = ""
        navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    
//     Animation
    fileprivate func buttonGuestureAnimation(for button: UIView) {
        UIView.animate(withDuration: 0.1, animations: {
            button.backgroundColor = UIColor.systemGray5
        }, completion: { _ in
            UIView.animate(withDuration: 0.1, animations: {
                button.backgroundColor = UIColor.white
            })
        })
    }
}
