//
//  ScoreCardCollectionViewCell.swift
//  CricPulse
//
//  Created by Yeasir Arefin Tusher on 11/2/23.
//

import UIKit

class ScoreCardCollectionViewCell: UICollectionViewCell {
    // View Outlets
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var matchStatusView: UIView!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var textualScoreView: UIView!
    
    
    // Label Outlets
    @IBOutlet weak var tournamentTitle: UILabel!
    @IBOutlet weak var matchNo: UILabel!
    @IBOutlet weak var matchStatusLabel: UILabel!  // Live or Upcoming or Completed
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var lTeamName: UILabel!
    @IBOutlet weak var vTeamName: UILabel!
    @IBOutlet weak var gameType: UILabel!
    @IBOutlet weak var lTeamScoreOne: UILabel!
    @IBOutlet weak var vTeamScoreOne: UILabel!
    @IBOutlet weak var textualScoreLabel: UILabel!
    
    //Image Outlets
    @IBOutlet weak var lTeamFlag: UIImageView!
    @IBOutlet weak var vTeamFlag: UIImageView!
    
    // Button Outlets
    @IBOutlet weak var notificationButtonOutlet: UIButton!
    
    // Stack Outlets
    @IBOutlet weak var scoreOneStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(10)
        backView.addBorder(color: UIColor.systemGray6, width: 1)
        notificationButtonOutlet.round(5)
        scoreView.round(5)
        matchStatusView.round(5)
        textualScoreView.round(5)
        gameType.round(5)
        gameType.addBorder(color: .systemGreen, width: 1)
    }
}
