//
//  ApiEndPintManager.swift
//  Muselink
//
//  Created by HarishParas on 18/02/21.
//  Copyright © 2021 Paras Technologies. All rights reserved.
//

import UIKit

extension NetworkManager {
    func sign_up(email:String = "",Password:String = "",completion: @escaping ((Result<SignUpModel,APIError>) -> Void)) {
        let param = [
            "email"         : email.replacingOccurrences(of: "+", with: ""),
            "password"      : Password.trimmingCharacters(in: .whitespacesAndNewlines),] as [String : Any]
        handleAPICalling(request: .signUp(param: param), completion: completion)
    }

    func uploadProfile(ProfileImg:UIImage?,completion: @escaping ((Result<SignUpModel,APIError>) -> Void)){
        handleAPICalling(request: .uploadProfileImg(profileImg: ProfileImg), completion: completion)
        }
    
}

func calcTime(time1: String,time2: String) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "h:mm a"
    let date1 = formatter.date(from: time1)!
    let date2 = formatter.date(from: time2)!
    let elapsedTime = date2.timeIntervalSince(date1)
    let hours = floor(elapsedTime / 60 / 60)
    print("\(Int(hours))")

   return "\(Int(hours))"
}
