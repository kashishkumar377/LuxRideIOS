//
//  APiConstants.swift
//  Contract Us
//
//  Created by Pankaj on 29/06/22.
//

import Foundation
import UIKit


class APiConstants {

    static let baseUrl = "http://wehandleyourpets.com/api/"

    static let baseUrlImg = "http://kaizendev.work/public/uploads/images/"
    static let loginUrl = baseUrl + "user/signin"
    static let signUp = baseUrl + "user/signup"

    static let ForgotPassword = baseUrl + "forgot-password"
    static let changePassword = baseUrl + "auth/updateMyPassword"
    static let getProfile = baseUrl + "user/"
    static let UploadImg = baseUrl + "user/upload"
    
}
