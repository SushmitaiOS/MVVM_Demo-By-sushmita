//
//  RegistrationModels.swift
//  Muselink
//
//  Created by HarishParas on 18/02/21.
//  Copyright © 2021 Paras Technologies. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - SignUpModel
struct SignUpModel: APIModel {
    var http_status: Int?
    let success: Int?
    let msg: String?
    let user: User?
    let access_token: String?
}

// MARK: - User
struct User: Codable {
    let id, name, email, password: String?
    let phoneCode, phone, photo, licenseNo: String?
    let licensePhoto, street, city, state: String?
    let country, deviceID, deviceName, deviceToken: String?
    let resetPin, facebookID, googleID, appleID: String?
    let bookingAlert, paymentAlert, adminAlert, role: String?
    let status: String?
    let createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, password
        case phoneCode = "phone_code"
        case phone, photo
        case licenseNo = "license_no"
        case licensePhoto = "license_photo"
        case street, city, state, country
        case deviceID = "device_id"
        case deviceName = "device_name"
        case deviceToken = "device_token"
        case resetPin = "reset_pin"
        case facebookID = "facebook_id"
        case googleID = "google_id"
        case appleID = "apple_id"
        case bookingAlert = "booking_alert"
        case paymentAlert = "payment_alert"
        case adminAlert = "admin_alert"
        case role, status
        case createdAt = "created_at"
    }
}
