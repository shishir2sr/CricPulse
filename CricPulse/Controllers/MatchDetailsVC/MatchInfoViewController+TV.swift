import Foundation
import UIKit


extension MatchInfoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupTableView() {
        matchInfoTableView.delegate = self
        matchInfoTableView.dataSource = self
        matchInfoTableView.register(UINib(nibName: "MatchInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchInfoTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchInfoTableView.dequeueReusableCell(withIdentifier: "MatchInfoTableViewCell") as! MatchInfoTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    
}
