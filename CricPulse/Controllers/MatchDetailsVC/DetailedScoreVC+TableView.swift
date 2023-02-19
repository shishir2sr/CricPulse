import Foundation
import UIKit

extension DetailedScoreViewController:UITableViewDataSource, UITableViewDelegate{
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    // Number of number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    // cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
}
