import Foundation
import UIKit

class ErrorPopup {
    var title: String
    var message: String
    var actions: [UIAlertAction]
    
    init(title: String, message: String, actions: [UIAlertAction]) {
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    func show() {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action)
        }
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
        
    }
}

class ErrorPopupBuilder {
    var title: String?
    var message: String?
    var actions: [UIAlertAction] = []
    
    func setTitle(_ title: String) -> ErrorPopupBuilder {
        self.title = title
        return self
    }
    
    func setMessage(_ message: String) -> ErrorPopupBuilder {
        self.message = message
        return self
    }
    
    func addAction(_ action: UIAlertAction) -> ErrorPopupBuilder {
        self.actions.append(action)
        return self
    }
    
    func build() -> ErrorPopup? {
        guard let title = title, let message = message else {
            return nil
        }
        return ErrorPopup(title: title, message: message, actions: actions)
    }
}

/**
let errorPopup = ErrorPopupBuilder()
    .setTitle("Error")
    .setMessage("An error occurred.")
    .addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    .build()

errorPopup?.show()
 */
