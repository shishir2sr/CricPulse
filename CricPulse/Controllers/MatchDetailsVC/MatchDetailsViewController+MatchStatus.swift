import Foundation

extension MatchDetailsViewController{
    
    // MARK: Setup UI's
    func setupScoreViews(){
        switch matchDetailsData?.matchStatus{
        case .finished:
            finishedMatchCases()
        case .ns:
            upcomingMatchCases()
        case .aban:
            abanMatchCases()
        case .postp:
            postPondedMatchCases()
        case .the1StInnings:
          liveMatchCases()
        case .the2NdInnings:
            liveMatchCases()
        case .innigsBreak:
            liveMatchCases()
        case .int:
            intMatchCases()
        case .none:
            print("Non")
        case .some(_):
            print("some")
        }
    }
    
    fileprivate func finishedMatchCases() {
        alertButtonOutlet.isHidden = true
        winPercenTageStackView.isHidden = true
        scoreStack.isHidden = false
        matchDate.isHidden = true
    }
    
    fileprivate func upcomingMatchCases() {
        alertButtonOutlet.isHidden = false
        alertButtonOutlet.isUserInteractionEnabled = true
        scoreStack.isHidden = true
        matchDate.isHidden = false
        note.text = viewModel.remainingTime()
        winPercenTageStackView.isHidden = true
        manOfTheMatchStackView.isHidden = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self  else {return}
            DispatchQueue.main.async {
                self.note.text = self.viewModel.remainingTime()
            }
        }
    }
    
    fileprivate func abanMatchCases() {
        alertButtonOutlet.isHidden = true
        alertButtonOutlet.isUserInteractionEnabled = false
        scoreStack.isHidden = true
        matchDate.isHidden = true
       
        matchDate.text = ""
        note.text = matchDetailsData?.matchNote
        manOfTheMatchStackView.isHidden = true
        winPercenTageStackView.isHidden = true
    }
    
    fileprivate func postPondedMatchCases() {
        alertButtonOutlet.isHidden = true
        alertButtonOutlet.isUserInteractionEnabled = false
        scoreStack.isHidden = true
        matchDate.isHidden = true
        matchDate.text = ""
        note.text = matchDetailsData?.matchNote
        manOfTheMatchStackView.isHidden = true
        winPercenTageStackView.isHidden = true
    }
    
    fileprivate func intMatchCases() {
        alertButtonOutlet.isHidden = true
        alertButtonOutlet.isUserInteractionEnabled = false
        scoreStack.isHidden = true
        matchDate.isHidden = true
        manOfTheMatchStackView.isHidden = true
        winPercenTageStackView.isHidden = true
    }
    
    
    
    fileprivate func liveMatchCases() {
        alertButtonOutlet.isHidden = true
        alertButtonOutlet.isUserInteractionEnabled = false
        scoreStack.isHidden = false
        matchDate.isHidden = true
        manOfTheMatchStackView.isHidden = true
        winPercenTageStackView.isHidden = true
    }
}
