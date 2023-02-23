import Foundation
import UIKit

extension SearchPlayerViewController: UITextFieldDelegate{
    
    func setupTextField(){
        searchBar.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let searchText = textField.text else {return true}
        self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: searchText)
        textField.endEditing(true)
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }
        else{
            textField.placeholder = "Write a players name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != ""{
            guard let searchText = textField.text else {return}
            self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: searchText)
        }
       
        Task{await self.searchPlayerViewModel.getPlayers()}
        textField.text = ""
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if text != ""{
            self.searchPlayerViewModel.playersData = CoreDataHelper.shared.searchPlayerbyName(with: text)
        }
        return true
    }
    
    
}
