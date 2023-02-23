import Foundation
import UIKit

extension SearchPlayerViewController: UITextFieldDelegate{
    
    func setupTextField(){
        searchBar.delegate = self
    }
    

    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Write a player name"
            return false
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if text != ""{
            self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: text)
            self.reloadTableView()
        }
        return true
    }
    
}
