//
//  ViewModelProtocols.swift
//  TeachMi
//
//  Created by Apps on 10/08/21.
//

import UIKit
import Foundation
import IBAnimatable


struct BrokenRule {
    var propertyName :String
    var message :String
}

/// the below protocols Manage alert and loader and validations

protocol ViewModel {
    var brokenRules :[BrokenRule] { get set}
    var isValid :Bool { mutating get }
    var showAlertClosure: (() -> ())? { get set }
    var updateLoadingStatus: (() -> ())? { get set }
    var didFinishFetch: (() -> ())? { get set }
    var error: String? { get set }
    var isLoading: Bool { get set }
}

/// Mark: Creating Generic datatype for accepting dynamic data

class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(_ v: T) {
        value = v
    }
}

// MARK:- Creating Binding UI for the UITextField
@IBDesignable
class BindingTextField : AnimatableTextField {
    var textChanged :(String) -> () = { _ in }
    func bind(callback :@escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ textField :UITextField) {
        print(textField.text!)
        self.textChanged(textField.text!)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            if textField.text! == "" && string == " "
            {
                return false
            }
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
                
            } else {
                return true
            }
        }
        catch {
            return false
        }
        return true
    }
}
