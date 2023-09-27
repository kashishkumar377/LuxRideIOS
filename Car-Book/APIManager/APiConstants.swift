//
//  APiConstants.swift
//  Contract Us
//
//  Created by Pankaj on 29/06/22.
//

import Foundation
import UIKit




let userDefault = UserDefaults.standard

class APiConstants {
    static let imageUrl = "http://18.118.198.144:8080/"
    static let baseUrl = "http://18.118.198.144:8080/carRental/"
    static let loginUrl = baseUrl + "login"
    static let signUp = baseUrl + "signup"
    static let ForgotPassword = baseUrl + "forgot-password"
    static let CustomerSupport = baseUrl + "createSupport"
    static let changePassword = baseUrl + "auth/updateMyPassword"
    static let getProfile = baseUrl + "me"
    static let UploadImg = baseUrl + "updateUserImg"
    static let CarType = baseUrl + "getVehicleTypes"
    static let CarCompany = baseUrl + "getCompanies"
    static let updateProfile = baseUrl + "updateUser"
}
