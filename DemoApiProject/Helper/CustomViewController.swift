//
//  CustomViewController.swift
//  HBCU App
//
//  Created by Paras on 14/02/22.
//

import UIKit
import CoreLocation

class CustomViewController: UIViewController {
    
    //MARK:-***********ViewLifeCycle*************
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func userCurrentLocation(location:CLLocation){
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation!
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
           CLLocationManager.authorizationStatus() == .authorizedAlways) {
            currentLoc = locationManager.location
            currentLoc = location
            print(currentLoc.coordinate.latitude)
            print(currentLoc.coordinate.longitude)
        }
    }
    func popToVC()
    {
        self.navigationController?.popViewController(animated: true)
    }
    func showToastData(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: self.view.frame.size.width * 0.7, height: 35))
        toastLabel.center.x = self.view.center.x
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
