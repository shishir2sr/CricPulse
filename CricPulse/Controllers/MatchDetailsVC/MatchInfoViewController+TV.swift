import Foundation
import UIKit


extension MatchInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupTableView() {
        matchInfoTableView.delegate = self
        matchInfoTableView.dataSource = self
        matchInfoTableView.register(UINib(nibName: "MatchInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchInfoTableViewCell")
    }
    
    // ReloadTableView
    func realoadTableView(){
        DispatchQueue.main.async {
            self.matchInfoTableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    // 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchInfoTableView.dequeueReusableCell(withIdentifier: "MatchInfoTableViewCell") as! MatchInfoTableViewCell
        if let matchDetailsVM = matchDetailsVM {
            cell.matchDate.text = matchDetailsVM.matchDate?.formatted(date: .complete, time: .omitted)
            cell.capacity.text = "\(matchDetailsVM.stadiumInfo?.capacity ?? 2000)"
            cell.city.text = matchDetailsVM.stadiumInfo?.city ?? "Not found"
            cell.matchNo.text = matchDetailsVM.matchNo ?? "1st"
            cell.matchTime.text = matchDetailsVM.matchDate?.formatted(date: .omitted, time: .shortened)
            cell.matchType.text = matchDetailsVM.matchType ?? "Unknown!"
            cell.seriesName.text = matchDetailsVM.tournamentName ?? "Unknown!"
            cell.venueName.text = matchDetailsVM.stadiumInfo?.name ?? "Unknown!"
            return cell
        }
        return cell
    }
    
    // Height for tableview
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
    
    
}
