//
//  APiConstants.swift
//  Contract Us
//
//  Created by Pankaj on 29/06/22.
//

import Foundation
import UIKit


class APiConstants {

    static let baseUrl = "http://18.118.198.144:8080/carRental/"
    static let loginUrl = baseUrl + "login"
    static let signUp = baseUrl + "signup"

    static let ForgotPassword = baseUrl + "forgot-password"
    static let changePassword = baseUrl + "auth/updateMyPassword"
    static let getProfile = baseUrl + "user/"
    static let UploadImg = baseUrl + "user/upload"
    
}
