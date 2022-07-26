//
//  SignUpVC.swift
//  DemoApiProject
//
//  Created by Paras on 22/07/22.
//

import UIKit

class SignUpVC: BaseClassVC {
    
    //OutLet of all ui elements for SignUp
    
    @IBOutlet weak var email_TxtFld : BindingTextField!{
        didSet{
            email_TxtFld.autocorrectionType = .no
            email_TxtFld.bind {[unowned self] in self.viewModel.email.value = $0 }
        }
    }
    @IBOutlet weak var pwd_TxtFld   : BindingTextField!{
        didSet{
            pwd_TxtFld.autocorrectionType = .no
            pwd_TxtFld.bind {[unowned self] in self.viewModel.password.value = $0}
        }
    }
    @IBOutlet weak var confrPwd_TxtFld   : BindingTextField!{
        didSet{
            confrPwd_TxtFld.autocorrectionType = .no
            confrPwd_TxtFld.bind {[unowned self] in self.viewModel.confirmpassword.value = $0}
        }
    }
    var viewModel : RegistrationViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = RegistrationViewModel(type: .signUp)
        setUpVM(model: viewModel)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func NextBtn(_ sender : UIButton){
        if viewModel.isValid {
            viewModel.signUpApi()
            viewModel.didFinishFetch = { [weak self] in
                DispatchQueue.main.async {
                    print("success")
                    
                }
            }
            viewModel.didFailFetch = { [weak self] in
                DispatchQueue.main.async {
                    
                }
            }
        }else{
            self.singleButtonAlertWith(message: viewModel.brokenRules.first?.message ?? "Re-enter your credentials", button: .ok)

        }
    }
}
