
import UIKit

class ScoreBoardViewController: UIViewController {
    @IBOutlet weak var teamOneBackgroundVIew: UIView!
    @IBOutlet weak var teamTwoBackgroundVIew: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamOneBackgroundVIew.addBorder(color: .systemGray4, width: 1)
        teamOneBackgroundVIew.round(10)
        teamOneBackgroundVIew.addShadow(opacity: 1, offset: 6, radius: 4)
        
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
    }
    
    // Team two button tap
    @objc func viewTwoTapped(){
        print("button 2 pressed")
        buttonGuestureAnimation(for: teamTwoBackgroundVIew)
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
