//
//  Constant.swift
//  EBike
//
//  Created by Harish Kumar on 07/05/22.
//

import Foundation
import UIKit



class Constant:NSObject{
   static let shared = Constant()
    let color = UIColor.red
}

struct AppFont {
    static let kPoppinsRegular = UIFont(name: "Poppins-Regular", size: 16.0)!
    static let kSFProDisplayRegular = UIFont(name: "SFProDisplay-Regular", size: 16.0)!
    static let kPoppinsSemibold = UIFont(name: "Poppins-SemiBold", size: 16.0)!
    static let kPoppinsMedium = UIFont(name: "Poppins-Medium", size: 16.0)!
    static let kPoppinsLight = UIFont(name: "Poppins-Light", size: 16.0)!
}

struct AppColor {
    static let kPlaceholderColor = UIColor(named: "PlaceholderColor")!
    static let kLightBorderColor = UIColor(named: "LightBorderColor")!
    static let kAppDarkOrange = UIColor(named: "AppDarkOrange")!
    static let kAppLightOrange = UIColor(named: "AppLightOrange")!
    static let kAppBlueColor = UIColor(named: "AppBlueColor")!
    static let LightBackgroundBlue = UIColor(named: "LightBackgroundBlue")!
    static let kAppWhiteClr = UIColor(named: "WhiteColor")!
    static let ButtonBlue = UIColor(named: "ButtonBlue")!
    static let ButtonOrange = UIColor(named: "ButtonOrange")
}

/// All constant  Message

struct Messages {
    static let emailError    = "Please enter your email"
    static let pwdError      = "Please ennter Your Password"
    static let verifyPending = "You account is not verified by administrator."
}

// MARK: - NOTIFICATION OBSERVER KEYS
struct NotificationKeys {
    static let kToggleMenu         = NSNotification.Name(rawValue: "ToggleSideMenu")
    static let kLoadViewController = NSNotification.Name(rawValue: "LoadViewController")
}


// MARK:- STORYBOARD ID'S
var storyboardIdParam   = "StoryboardIDS"
var storyboardTypeParam = "StoryboardType"

struct StoryboardID {
    static let kHomeVC      = "HomeVC"
    static let kMyProfileVC = "MyProfileVC"
    static let kSettingVC   = "SettingVC"
    static let kFavoriteVC  = "FavouriteVC"
    static let kBookingVC   = "AllBookingVC"
}


enum StoryboardType: String{
    case main     = "Main"
    case home     = "Home"
    case settings = "Settings"
}
