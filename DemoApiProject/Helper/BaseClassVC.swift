//
//  BaseClassVC.swift
//  Muselink
//
//  Created by appsdeveloper Developer on 02/03/21.
//  Copyright © 2021 Paras Technologies. All rights reserved.
//

import UIKit
import JGProgressHUD
import Loaf

class BaseClassVC: CustomViewController{
    private lazy var progressHUD : JGProgressHUD = {
        let progressHUD = JGProgressHUD()
        progressHUD.textLabel.text = "Loading"
        progressHUD.animation = JGProgressHUDFadeZoomAnimation()
        progressHUD.interactionType = JGProgressHUDInteractionType.blockAllTouches
        return progressHUD
    }()
    @IBAction func action_Dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func action_ViewDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
}
extension BaseClassVC {
    func setUpVM(model:ViewModel){
        hideKeyboardWhenTappedAround()
        var viewModel = model
        viewModel.updateLoadingStatus = { [weak self] in
            DispatchQueue.main.async {
                let _ = viewModel.isLoading ? self?.showProgressHUD() : self?.hideProgressHUD()
            }
        }
        viewModel.showAlertClosure = {  [weak self] in
            if let error = viewModel.error {
                DispatchQueue.main.async {
                    guard let self = self else {return}
                    //self.singleButtonAlertWith(message: error , button: .ok)
                }
            }
        }
    }
   
    func showErrorMessages(message:String) {
        DispatchQueue.main.async {
            Loaf(message, state: .custom(.init(backgroundColor: .gray, icon: UIImage(named: "moon"))), sender: self).show()
        }
    }
    func showSuccessMessages(message:String) {
        DispatchQueue.main.async {
            Loaf(message, state: .custom(.init(backgroundColor: .gray, icon: UIImage(named: "moon"))), sender: self).show()
        }
    }
    func showProgressHUD() {
        progressHUD.show(in: self.view)
    }
    func hideProgressHUD() {
        progressHUD.dismiss()
    }
    func setIdleTimerActive(_ active: Bool) {
        UIApplication.shared.isIdleTimerDisabled = !active
    }
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 0.2)
        return randomColor
    }
    
    func setViewFrame(view:UIView){
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(view)
        view.isHidden = true
    }
}
extension BaseClassVC {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension BaseClassVC {
    func setBackgroundObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
        
        let notificationCenter1 = NotificationCenter.default
        notificationCenter1.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    @objc func appMovedToBackground() {
        print("App moved to background!")
    }
    @objc func appMovedToForeground() {
        print("App moved to Foreground!")
    }
    
}


struct LocationData {
    var town : [String]?
}
