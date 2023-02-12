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
    @IBOutlet weak var MatchStatusView: UIView!
    
    // Label Outlets
    @IBOutlet weak var tournamentTitle: UILabel!
    @IBOutlet weak var matchNo: UILabel!
    @IBOutlet weak var matchStatusLabel: UILabel!  // Live or Upcoming or Completed
    @IBOutlet weak var stadiumName: UILabel!
    
    // Button Outlets
    @IBOutlet weak var notificationButtonOutlet: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round(10)
        backView.addBorder(color: UIColor.systemGray6, width: 1)
        notificationButtonOutlet.round(5)
        
        MatchStatusView.round(5)
    }

}
