import Foundation
import UIKit


// MARK: - Uitext field delegate
extension SearchPlayerViewController: UITextFieldDelegate{
    func setupTextField(){
        searchBar.delegate = self
        searchBar.round(5)
        searchBar.addShadow(opecity: 0.8, size: 5, radius: 2, color: UIColor.darkGray)
        searchBar.addBorder(color: UIColor.systemGray6, width: 1)
    }
    
    // Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchText = textField.text else {return true}
        self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: searchText)
        textField.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    // editing ended
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Write a players name"
            return false
        }
    }
    
    // did editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != ""{
            guard let searchText = textField.text else {return}
            self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: searchText)
        }
        Task{await self.searchPlayerViewModel.getPlayers()}
        textField.text = ""
    }
    // Should change
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if text != ""{
            self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: text)
        }
        return true
    }
}
