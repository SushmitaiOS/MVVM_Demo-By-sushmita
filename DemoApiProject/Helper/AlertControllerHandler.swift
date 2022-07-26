//
//  AlertControllerHandler.swift
//  oink
//
//  Created by HarishParas on 18/05/20.
//  Copyright © 2020 HarishParas. All rights reserved.
//

import UIKit

typealias NullableCompletion = (() -> ())?
typealias AlertButtonWithAction = (AlertButtonTitle, NullableCompletion)

extension BaseClassVC {
    func singleButtonAlertWith(message: String,
                               button action: AlertButtonTitle,
                               completionOnButton: NullableCompletion = nil,
                               completionOPresentationOfAlert:  NullableCompletion = nil) {
        let alert = UIAlertController(title:"", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: action.value, style: .default, handler: { action in
            if let methodAfterCompletion = completionOnButton {
                methodAfterCompletion()
            }
        }))
        present(alert, animated: true, completion: completionOPresentationOfAlert)
    }
    func alertWith(title: AlertTitle = .appName, message: Messages, completionOPresentationOfAlert:  NullableCompletion = nil, actions: AlertButtonWithAction...) {
        let alertController = UIAlertController(title: title.value, message: "\(message)", preferredStyle: UIAlertController.Style.alert)
        for (title, action) in actions {
            let alertAction = UIAlertAction(title: title.value, style:
            title == .cancel ? .destructive : .default) { _ in
                if let actionToPerform = action {
                    actionToPerform()
                }
            }
            alertController.addAction(alertAction)
        }
        present(alertController, animated: true, completion: completionOPresentationOfAlert)
    }
    
    
    //MARK:- Alert
    func showingAlert(msg:String)
    {
        _ = UIFont.init(name: "", size: 15) ?? UIFont.boldSystemFont(ofSize: 15)
        let attributedString = NSAttributedString(string:"", attributes: [ NSAttributedString.Key.foregroundColor: UIColor.init(red: 34/255.0, green: 104/255.0, blue: 216/255.0, alpha: 1)])
        let alertVC = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alertVC.setValue(attributedString, forKey: "attributedTitle")
        alertVC.view.tintColor = UIColor.init(red: 34/255.0, green: 104/255.0, blue: 216/255.0, alpha: 1)
        
//        if handlers == nil{
//            let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertVC.addAction(OKAction)
        //}else{
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alertVC.addAction(OKAction)
      //  }
        
        self.present(alertVC, animated: true, completion: nil)
    }
  
}

enum AlertButtonTitle {
    case ok, cancel, settings, yes, no, delete,resendVerify
    var value: String {
        switch self {
        case .ok: return "OK"
        case .cancel: return "Cancel"
        case .settings: return "Settings"
        case .yes: return "YES"
        case .no: return "NO"
        case .delete: return "Remove"
        case .resendVerify: return "Resend Verification Link"
        }
    }
}

enum AlertTitle {
    case appName
    
    var value: String {
        switch self {
        case .appName: return ""
        }
    }
}
