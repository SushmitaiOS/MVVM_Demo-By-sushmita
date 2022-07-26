//
//  RegistrationViewModel.swift
//  EBike
//
//  Created by Paras on 11/07/22.
//

import Foundation
import UIKit

/**
 All Registraion process Api
 manage all the param and validation
 */
class RegistrationViewModel : NSObject,ViewModel{
    
    /**
     Below enum define ModelType
     and on the basis of model type validation is call
     */
    
    enum ModelType{
        case signUp
    }
    
    var modelType        : ModelType
    var brokenRules      : [BrokenRule]    = [BrokenRule]()
    var licenseImg       : UIImage?
    var email            : Dynamic<String> = Dynamic("")
    var password         : Dynamic<String> = Dynamic("")
    var confirmpassword  : Dynamic<String> = Dynamic("")
    var uploadImg        : UIImage?
    var isValid               : Bool {
        get {
            self.brokenRules = [BrokenRule]()
            self.Validate()
            return self.brokenRules.count == 0 ? true : false
        }
    }
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    var didFailFetch  : (() -> ())?
    var didFinishFetch_UserData: (() -> ())?
    init(type:ModelType) {
        modelType = type
    }
    
    //API related Variable
    var error: String? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
}


extension RegistrationViewModel {
    private func Validate(){
        switch modelType{

        case .signUp:
            if email.value == "" || email.value == " "{
                self.brokenRules.append(BrokenRule(propertyName: "NoEmail", message: "Enter email Id"))
            }
            if password.value == "" || password.value == " "{
                self.brokenRules.append(BrokenRule(propertyName:"NoConfirmPassword", message: " Enter Your Password"))
            }
            if password.value.count < 8 {
                self.brokenRules.append(BrokenRule(propertyName:"ShortNewPassword", message: " Password min 8 Char"))
            }
            if confirmpassword.value == "" || confirmpassword.value == " "{
                self.brokenRules.append(BrokenRule(propertyName: "NoPassword",message: " Re-Enter Your Password"))
            }
            if password.value != confirmpassword.value {
                self.brokenRules.append(BrokenRule(propertyName:"ConfirmPaswordNotMatch", message: " Confirm new password not matched"))
            }
        }
    }
}

/**
 All Registration process Api Methods
 */

extension RegistrationViewModel {
    

    
    /**
     Sign up a new user with email and password
     
     - Parameters:
     - email: email address of user
     - password:  password of user
     
     - Returns: True if the user has successfully signed up, False otherwise
     */
    
    func signUpApi(){
        isLoading = true
        let model = NetworkManager.sharedInstance
        model.sign_up(email: email.value, Password: password.value) { [weak self](result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result{
            case .success(let res):
                print(res)
                self.didFinishFetch?()
            case .failure(let err):
                switch err {
                case .errorReport(let desc):
                    print(desc)
                    self.didFailFetch?()
                    self.error = desc
                }
                print(err.localizedDescription)
            }
        }
    }
    
    /**
     Upload Image
     
     - Parameters:
     - image: email address of user
     
     - Returns: True if the user has successfully signed up, False otherwise
     */
    
    func uploadProfile(){
        isLoading = true
        let model = NetworkManager.sharedInstance
        model.uploadProfile(ProfileImg: uploadImg) { [weak self](result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result{
            case .success(let res):
                print(res)
                self.didFinishFetch?()
            case .failure(let err):
                switch err {
                case .errorReport(let desc):
                    print(desc)
                    self.didFailFetch?()
                    self.error = desc
                }
                print(err.localizedDescription)
            }
        }
    }
}
