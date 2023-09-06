//
//  Constants.swift
//  VisaLo
//
//  Created by Caksu Sethi on 24/05/23.
//

import Foundation
import UIKit
class Constant {
    
    struct Setting {
        var name: String
    }
    
    struct Home {
        var name: String
        var imgName : String
    }
    
    static let settingArr = [Setting(name: "Push Notification") ,Setting(name: "Privacy & Policy"),Setting(name: "Help And Support"),Setting(name: "About Us"),Setting(name: "Terms & Conditions"),Setting(name: "Contact Us"),Setting(name: "Logout")]

    static let HomeArr = [Home(name: "Appointment For Home", imgName: "imgAppoit"),Home(name: "Tracking Visa", imgName: "imgVisa"),Home(name: "Calling", imgName: "imgCall"),Home(name: "ILETS Test", imgName: "imgHelp"),Home(name: "NRI Help", imgName: "imgHelp")]
    enum AppStoryBoard : String {
        case Main
        case OwnerStoryboard
        case Home
        case UserHome
        case Settings
        var instance : UIStoryboard {
            UIStoryboard(name: rawValue, bundle: nil)
        }
    }
 
    struct AppRootFlow {
        static let  userAuth = "User"
        static let home = "Home"
    }
    
    struct UserType {
        static let  user = "user"
        static let trainee = "agent"
    }
    
    
    struct AppFont {
        static let regular =  "Poppins-Regular"
        static let light = "Poppins-Light"
        static let bold =  "Poppins-Bold"
        static let medium =  "Poppins-Medium"
        static let semiBold = "Poppins-SemiBold"
    }
   
    static var deviceType = "iOS"
    
    struct color {
            static let appThemeHexColor = "F57000"
            static let appColorGrey = "1A1A1A"
            static let ThreeThree = "333333"
            static let borderColor = UIColor(red:239/255, green:239/255, blue:244/255, alpha: 1).cgColor
           static let priceColor = UIColor(red:102/255, green:121/255, blue:192/255, alpha: 1).cgColor
        }
        struct ValidationMessages {
            static let internetAppearOffline = "Internet appears to be offline"
            static let alert = "Alert!"
            static let oops = "Oops!"
            static let locationOff = "This app is unusable if you don't authorize this app to use your location!"
            static let cameraOff = "Need access of your camera!"
            
        }
        
        struct Validation {
            static let usernameEmpty = "Please enter your name."
            static let usernameEmailEmpty = "Please enter your username or email address."

            static let name = "Please enter your name."
            static let emailEmpty = "Please enter your email."
            static let emailInvalid = "Please enter your valid email."
            static let otpEmpty = "Please enter your otp."
            static let otpInvalid = "Please enter your 4 digit otp."
            static let emptyPhoneNumber = "Please enter your phone number."
            static let invalidPhoneNumber = "Please enter a valid phone number."
            static let passwordEmpty = "Please enter your password."
            static let passwordInvalid = "Please enter a 8 characters password"
            static let emptyNewPassword = "Please enter your new password."
            static let emptyOldPassword = "Please enter your old password."
            static let confirmPasswordEmpty = "Please enter your confirm password."
            static let passwordsNotMatching = "Password and confirm password did not match."
            static let privacyPolicy = "Please accept terms and policy."
            
        }
        
        enum FieldType : String {
            case phoneNumber
        }
        
        struct UserDefaultConstant {
            static let DeviceToken = UserDefaults.standard.value(forKey: "token") as? String
            static let DeviceId = UIDevice.current.identifierForVendor!.uuidString

        }
        
        
        
        struct APIResponseCodes {
            static let statusCodeSuccessfull = 200
            static let statusCodeCreatedSuccessfull = 201
            static let statusCodeInternalServerError = 500
            static let statusCodeInternetNotAvailable = -1009
        }

}

