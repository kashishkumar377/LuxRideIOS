//
//  UserModel.swift
//  Contract Us
//
//  Created by Caksu on 29/06/22.
//

import Foundation
import ObjectMapper
import UIKit




class User : Mappable {
    var rating : String?
    var id : Int?
    var name : String?
    var email : String?
    var created_at : String?
    var updated_at : String?
    var image : String?
    var active : Int?
    var notifications : Int?
    var image_url : String?
    var password : String?
    var oldPassword : String?
    var device_token : String?
    var device_type : String?
    var device_id : String?
    var newPassword : String?
    var fullName : String?
    var type : String?
    var status : Int?
    var message : String?
    var error : Bool?
    var user_type : String?
    var on_off : Int?
    var fullname : String?
    var mobileNumber : String?
    var mobileNumberInt : Int?
    var passwordCurrent : String?
    var passwordConfirm : String?
    var phone_no: String?
    var usertype: String?
    var token : String?
    var booking_type : String?
    var walk_type : String?
    var address2 : String?
    var cnt_animal : String?
    var walk_duration : String?
    var user_id : Int?
    var address : String?
    var booking_date : String?
    var instruction_type : String?
    var write_note : String?
    var access_key : String?
    var note : String?
    var lat : String?
    var lon : String?
    var booking_id : Int?
    var employee_id : String?
    var request_status : String?
    var profile_picture : String?
    var user1 : String?
    var user2 : String?
    var review : String?
    var account_holder_name : String?
    var account_number : String?
    var sort_code : String?
    var bank_name : String?
    var country : String?
    var client_id : Int?
    var card_number: String?
    var card_cvv : String?
    var card_expird  : String?
    var amount : String?
    var is_bank_detail : String?
    var is_payment : Int?
    var price : String?
    var additonal_price : String?
    var about : String?
    var cover_img : String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        about <- map["about"]
        price <- map["price"]
        additonal_price <- map["additonal_price"]
        address2 <- map["address2"]
        cnt_animal <- map["cnt_animal"]
        is_payment <- map["is_payment"]
        is_bank_detail <- map["is_bank_detail"]
        client_id  <- map["client_id"]
        card_number <- map["card_number"]
        card_cvv  <- map["card_cvv"]
        card_expird   <- map["card_expird"]
        amount  <- map["amount"]
        country <- map["country"]
        account_holder_name <- map["account_holder_name"]
        account_number <- map["account_number"]
        sort_code <- map["sort_code"]
        bank_name <- map["bank_name"]
        user1  <- map["user1"]
        user2  <- map["user2"]
        review  <- map["review"]        
        rating <- map["rating"]
        profile_picture <- map["profile_pic"]
        cover_img <- map["cover_image"]
        booking_id <- map["booking_id"]
        employee_id <- map["employee_id"]
        request_status <- map["request_status"]        
        lat <-  map["lat"]
        lon <-  map["lon"]
        booking_type   <- map["booking_type"]
        walk_type   <- map["walk_type"]
        walk_duration   <- map["walk_duration"]
        user_id   <- map["user_id"]
        address   <- map["address"]
        booking_date   <- map["booking_date"]
        instruction_type   <- map["instruction_type"]
        write_note   <- map["write_note"]
        access_key   <- map["access_key"]
        note   <- map["note"]
        token <- map["token"]
        device_id <- map["device_id"]
        phone_no <- map["phone_no"]
        usertype <- map["usertype"]
        mobileNumberInt <- map["mobileNumber"]
        passwordCurrent <- map["passwordCurrent"]
        password <- map["password"]
        passwordConfirm <- map["passwordConfirm"]
        
        mobileNumber <- map["mobileNumber"]
        fullname <- map["fullname"]
        email <- map["email"]
        password <- map["password"]
        type <- map["type"]
        device_token <- map["device_token"]
        device_type <- map["device_type"]
        
        
        on_off <- map["on_off"]
        user_type <- map["user_type"]
        status <- map["status"]
        message <- map["message"]
        error <- map["error"]
        user_type <- map["user_type"]
        type <- map ["type"]
        device_token <- map["device_token"]
        device_type <-  map["device_type"]
        password <- map["password"]
        oldPassword <- map["oldPassword"]
        newPassword <- map["newPassword"]
        id <- map["id"]
        name <- map["name"]
        fullName <- map["fullName"]
        email <- map["email"]
        
    }
    
    
    class var curentUser:User? {
        set {
            if newValue == nil {
                UserDefaults.standard.removeObject(forKey: "currentUser")
                currentUserExists = false
            }  else {
                print(newValue?.toJSON() as Any)
                UserDefaults.standard.set(newValue?.toJSON(), forKey:"currentUser")
                currentUserExists = true
            }
            UserDefaults.standard.synchronize()
        }
        get {
            let dictUser = UserDefaults.standard.dictionary(forKey:"currentUser")
            if dictUser != nil {
                return Mapper<User>().map(JSON:(dictUser)!)!
            }
            return nil
        }
    }
    
    class var currentUserExists:Bool {
        set {}
        get {
            return UserDefaults.standard.dictionary(forKey:"currentUser") != nil
        }
    }
    
    class func new() -> User {
        let customer = Mapper<User>().map(JSON: [:])
        return customer!
    }
    
    class func logOutUser() {
        User.resetCurrentUser()
    }
    
    class func resetCurrentUser() {
        User.curentUser = nil
        UserDefaults.standard.removeObject(forKey: "currentUser")
        UserDefaults.standard.synchronize()
    }
    
    
    func signIn(callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
        NetworkManager.sendRequest(urlPath: APiConstants.loginUrl, type: .post, parms: self.toJSON()) { responseObject, suces in
            
            if (responseObject["success"] as? Int ?? 0) == 1{
                let user = Mapper<User>().map(JSON: responseObject["data"] as? [String:Any] ?? [:])
                User.curentUser = user
                UserDefaults.standard.set(responseObject["token"] as? String ?? "", forKey: "token")
                callBack(user,responseObject["message"] as? String ?? "",200)
            } else {
                callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
            }
            
        } faliure: { errMsg, errCode in
            callBack(nil,errMsg,errCode)
        }
    }
    
    func getProfileAPi(_ id:Int?,callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
        NetworkManager.sendRequest(urlPath: "\(APiConstants.getProfile)\(id ?? 0)", type: .get, parms: [:]) { responseObject, suces in
            if (responseObject["success"] as? Int ?? 0) == 1{
                    let response = (responseObject["data"] as? [String:Any] ?? [:])
                    let user = Mapper<User>().map(JSON: response)
                    callBack(user,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeSuccessfull)
                } else {
                    callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
                }
            
        } faliure: { errMsg, errCode in
            callBack(nil,errMsg,errCode)
        }
        
    }
    
    
    func signUp(_ img:Data?,callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
        _ = signupValidation { errMsg, suc in
            if suc {
                NetworkManager.uploadTo(true, imgVw: img,urlPath: APiConstants.signUp, paramName: "profile_pic", param: self.toJSON(), fileType: "") { responseObject, suces in
                    if (responseObject?["success"] as? Int ?? 0) == 1{
                        let user = responseObject?["data"] as? [String:Any] ?? [:]
                        let res = Mapper<User>().map(JSON: user)
                        User.curentUser = res
                        callBack(res,responseObject?["message"] as? String ?? "",200)
                    } else {
                        callBack(nil,responseObject?["message"] as? String ?? "",400)
                    }
                } faliure: { errMsg,errCode in
                    callBack(nil,"errMsg",500)
                }
            } else {
                callBack(nil,errMsg,500)
            }
        }
    }
    
   
    
    
    
    
    func signupValidation(callBack:((_ errMsg:String,_ suc:Bool)->Void)!) {
        if self.usertype == "" {
            callBack("Please select your user type",false)

        }  else if self.name == "" {
            callBack("Please enter your name",false)
        } else if self.email == "" {
            callBack("Please enter your email",false)

        } else if (self.email?.isValidEmail()) == false {
            callBack("Please enter your valid email",false)

        } else if self.mobileNumber == "" {
            callBack("Please enter your mobile number",false)
        } else if self.address == "" {
            callBack("Please enter your address",false)
        }  else if self.about == "" {
            callBack("Please enter your about info",false)
        } else if self.password == "" {
            callBack("Please enter your password",false)

        } else if self.passwordConfirm == "" {
            callBack("Please enter your confirm password",false)

        } else if self.password != self.passwordConfirm {
            callBack("Password and confirm password does'nt match",false)

        }  else {
            callBack("",true)
        }
    }
}
