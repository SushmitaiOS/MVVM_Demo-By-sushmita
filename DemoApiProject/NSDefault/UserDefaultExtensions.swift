//
//  UserDefaultExtensions.swift
//  Muselink
//
//  Created by appsdeveloper Developer on 11/01/21.
//  Copyright © 2021 Paras Technologies. All rights reserved.
//

import Foundation

fileprivate enum DefaultKey : String {
    case HasLogIn
    case UserID
    case token
    case firstName
    case lastName
    case emailId
    case userStatus
    case current_Lat
    case current_Long
    case licenceImg
    case currentUserType
    case studentInternational
    case studentSport
    case studentBand
    case deviceToken
    case pushkitToken
    case profilePic
    case pushFcmToken
    case recruiterStatus
}
extension UserDefaults {
    fileprivate class var appSuit : UserDefaults {
        if let suit =  UserDefaults(suiteName: "TeachMi") {
            return suit
        }
        else {
            return UserDefaults.standard
        }
    }
}
struct AppSettingsData {
    
    static var studentInternational : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.studentInternational.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.studentInternational.rawValue)
            useDef.synchronize()
        }
    }
    static var recriterStatus : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.recruiterStatus.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.recruiterStatus.rawValue)
            useDef.synchronize()
        }
    }
    static var studentSport : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.studentSport.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.studentSport.rawValue)
            useDef.synchronize()
        }
    }
    static var studentBand : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.studentBand.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.studentBand.rawValue)
            useDef.synchronize()
        }
    }
    static var emailId : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.emailId.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.emailId.rawValue)
            useDef.synchronize()
        }
    }
    static var currentUserType : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.currentUserType.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.currentUserType.rawValue)
            useDef.synchronize()
        }
    }
    static var licenceImg : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.licenceImg.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.licenceImg.rawValue)
            useDef.synchronize()
        }
    }
    static var current_Lat: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.current_Lat.rawValue) ?? "0.0"
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.current_Lat.rawValue)
            useDef.synchronize()
        }
    }
    static var current_Long: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.current_Long.rawValue) ?? "0.0"
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.current_Long.rawValue)
            useDef.synchronize()
        }
    }
    static var firstNme : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.firstName.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.firstName.rawValue)
            useDef.synchronize()
        }
    }
    
    static var lastNme : String{
        get{
            let userDef = UserDefaults.appSuit
            return userDef.string(forKey: DefaultKey.lastName.rawValue) ?? ""
        }
        set{
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.lastName.rawValue)
            useDef.synchronize()
        }
    }
 
    static var hasLogin: Bool {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.bool(forKey: DefaultKey.HasLogIn.rawValue)
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.HasLogIn.rawValue)
            useDef.synchronize()
        }
    }
   
    static var userID: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.UserID.rawValue) ?? ""
        } set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.UserID.rawValue)
            useDef.synchronize()
        }
    }
    static var token: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.token.rawValue) ?? ""
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.token.rawValue)
            useDef.synchronize()
        }
    }
    static var deviceToken: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.deviceToken.rawValue) ?? ""
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.deviceToken.rawValue)
            useDef.synchronize()
        }
    }
    static var profilePic: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.profilePic.rawValue) ?? ""
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.profilePic.rawValue)
            useDef.synchronize()
        }
    }
    static var pushkitToken: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.pushkitToken.rawValue) ?? ""
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.pushkitToken.rawValue)
            useDef.synchronize()
        }
    }
    static var pushFcmToken: String {
        get {
            let useDef = UserDefaults.appSuit
            return useDef.string(forKey: DefaultKey.pushFcmToken.rawValue) ?? ""
        }
        set {
            let useDef = UserDefaults.appSuit
            useDef.set(newValue, forKey: DefaultKey.pushFcmToken.rawValue)
            useDef.synchronize()
        }
    }
}
