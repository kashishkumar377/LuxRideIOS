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
  
    var firstName : String?
    var lastName : String?
    var email : String?
    var phone : String?
    var password : String?
    var role : String?
    var deviceType : String?
    var fcmToken : String?
    var countryCode : String?
    var data : UserData?
    var success : Bool?
    var message : String?
    var token : String?
    var signUpType : String?
    var socaialId : String?
    var title : String?
    var profileImg : String?
    var description : String?
    var language: String?
    var ninNumber : String?
    var isEmailVerified: Int?
    var isPhoneVerified : Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        socaialId <- map["socaialId"]
        signUpType <- map["signUpType"]
        data <- map["data"]
        success <- map["success"]
        message <- map["message"]
        token <- map["token"]
        countryCode <-  map["countryCode"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        phone <- map["phone"]
        password <- map["password"]
        role <- map["role"]
        deviceType <- map["deviceType"]
        fcmToken <- map["fcmToken"]
        description <- map["description"]
        title <- map["title"]
        language <- map["language"]
        ninNumber <- map["ninNumber"]
      profileImg <- map["profileImg"]
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
                let user = Mapper<User>().map(JSON: responseObject)
                User.curentUser = user
             
              UserStoreSingleton.shared.isLoggedIn = true
                callBack(user,responseObject["message"] as? String ?? "",200)
            } else {
                callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
            }
        } faliure: { errMsg, errCode in
            callBack(nil,errMsg,errCode)
        }
    }

  func contactSupport(callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
    NetworkManager.sendRequest(urlPath: APiConstants.CustomerSupport, type: .post, parms: self.toJSON()) { responseObject, suces in
          if (responseObject["success"] as? Int ?? 0) == 1{
              let user = Mapper<User>().map(JSON: responseObject)

              callBack(user,responseObject["message"] as? String ?? "",200)
          } else {
              callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
          }
      } faliure: { errMsg, errCode in
          callBack(nil,errMsg,errCode)
      }
  }

  func socialLogin(callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
      NetworkManager.sendRequest(urlPath: APiConstants.loginUrl, type: .post, parms: self.toJSON()) { responseObject, suces in
          if (responseObject["success"] as? Int ?? 0) == 1{
              let user = Mapper<User>().map(JSON: responseObject)
              User.curentUser = user

            UserStoreSingleton.shared.isLoggedIn = true
              callBack(user,responseObject["message"] as? String ?? "",200)
          } else {
              callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
          }
      } faliure: { errMsg, errCode in
          callBack(nil,errMsg,errCode)
      }
  }
    
    func getProfileAPi(callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
        NetworkManager.sendRequest(urlPath: "\(APiConstants.getProfile)", type: .get, parms: [:]) { responseObject, suces in
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


  func getCarTypeAPi(callBack:((_ loginUser:[CarTypeData]?,_ errMsg:String,_ errCode:Int)->Void)!) {
      NetworkManager.sendRequest(urlPath: APiConstants.CarType, type: .get, parms: [:]) { responseObject, suces in
          if (responseObject["success"] as? Int ?? 0) == 1{
                  let response = (responseObject["data"] as? [[String:Any]] ?? [[:]])
                  let user = Mapper<CarTypeData>().mapArray(JSONArray: response)
                  callBack(user,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeSuccessfull)
              } else {
                  callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
              }

      } faliure: { errMsg, errCode in
          callBack(nil,errMsg,errCode)
      }
  }

  func getCar(callBack:((_ loginUser:[GetSubCatData]?,_ errMsg:String,_ errCode:Int)->Void)!) {
      NetworkManager.sendRequest(urlPath: APiConstants.CarSubCat, type: .get, parms: [:]) { responseObject, suces in
          if (responseObject["success"] as? Int ?? 0) == 1{
                  let response = (responseObject["data"] as? [[String:Any]] ?? [[:]])
                  let user = Mapper<GetSubCatData>().mapArray(JSONArray: response)
                  callBack(user,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeSuccessfull)
              } else {
                  callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
              }

      } faliure: { errMsg, errCode in
          callBack(nil,errMsg,errCode)
      }
  }

  func getCarCompaniesApi(callBack:((_ loginUser:[CarTypeData]?,_ errMsg:String,_ errCode:Int)->Void)!) {
      NetworkManager.sendRequest(urlPath: APiConstants.CarCompany, type: .get, parms: [:]) { responseObject, suces in
          if (responseObject["success"] as? Int ?? 0) == 1{
                  let response = (responseObject["data"] as? [[String:Any]] ?? [[:]])
                  let user = Mapper<CarTypeData>().mapArray(JSONArray: response)
                  callBack(user,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeSuccessfull)
              } else {
                  callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
              }

      } faliure: { errMsg, errCode in
          callBack(nil,errMsg,errCode)
      }
  }
    
    
    func signUp(callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
      //  signupValidation { errMsg, suc in
           // if suc {
                NetworkManager.sendRequest(urlPath: APiConstants.signUp, type: .post, parms: self.toJSON()) { responseObject, suces in
                    if (responseObject["success"] as? Int ?? 0) == 1{
                        let user = Mapper<User>().map(JSON: responseObject)
                        User.curentUser = user
                        callBack(user,responseObject["message"] as? String ?? "",200)
                    } else {
                        callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
                    }
                    
                } faliure: { errMsg, errCode in
                    callBack(nil,errMsg,errCode)
                }
//            } else {
//                callBack(nil,errMsg,500)
//            }
      //  }
    }

  func updateProfile(callBack:((_ loginUser:User?,_ errMsg:String,_ errCode:Int)->Void)!) {
     // signupValidation { [self] errMsg, suc in
        //  if suc {
              NetworkManager.sendRequest(urlPath: APiConstants.updateProfile, type: .post, parms: self.toJSON()) { responseObject, suces in
                  if (responseObject["success"] as? Int ?? 0) == 1{
                      let user = Mapper<User>().map(JSON: responseObject)
                    // User.curentUser = user
                      callBack(user,responseObject["message"] as? String ?? "",200)
                  } else {
                      callBack(nil,responseObject["message"] as? String ?? "",Constant.APIResponseCodes.statusCodeInternalServerError)
                  }

              } faliure: { errMsg, errCode in
                  callBack(nil,errMsg,errCode)
              }
          }
//        else {
//              callBack(nil,errMsg,500)
//          }
      //}
 // }
    
    func uploadImg(_ imgData:Data,callBack:((_ errMsg:String,_ errCode:Int)->Void)!) {
        NetworkManager.uploadTo(true, imgVw: imgData, urlPath: APiConstants.UploadImg, paramName: "files", param: [:], fileType: "") { Response, suces in
            
            if Response!["success"] as? Int ?? 0 == 1 {
                callBack(Response!["message"] as? String ?? "",200)
            } else {
                callBack(Response!["message"] as? String ?? "",400)
            }
        } faliure: { errCode, errMsg in
            print(errMsg)
            callBack(errMsg,errCode)
        }

    }
    
    func signupValidation(callBack:((_ errMsg:String,_ suc:Bool)->Void)!) {
//         if self.firstName == "" {
//            callBack("Please enter your first name",false)
//        } else if self.lastName == "" {
//            callBack("Please enter your last name",false)
//        }else if self.email == "" {
//            callBack("Please enter your email",false)
//        } else if (self.email?.isValidEmail()) == false {
//            callBack("Please enter your valid email",false)
//        } else if self.password == "" {
//            callBack("Please enter your password",false)
//        } else if self.phone == "" {
//            callBack("Please enter your mobile number",false)
//        }  else {
//            callBack("",true)
//        }
    }
}

/*
 else if (self.password?.validate()) == false {
   callBack("Please enter your valid password",false)
} 
 */

struct UserData : Mappable {
    var firstName : String?
    var lastName : String?
    var email : String?
    var phone : String?
    var countryCode : String?
    var password : String?
    var deviceType : String?
    var role : String?
    var _id : String?
    var createdAt : String?
    var updatedAt : String?
    var __v : Int?
    var vehicleTypeName : String?
    var vehicleTypeImg : String?
    var active : Bool?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        phone <- map["phone"]
        countryCode <- map["countryCode"]
        password <- map["password"]
        deviceType <- map["deviceType"]
        role <- map["role"]
        _id <- map["_id"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        __v <- map["__v"]
        vehicleTypeName <- map["vehicleTypeName"]
        vehicleTypeImg <- map["vehicleTypeImg"]
        active <- map["active"]
    }

}


struct CarTypeData : Mappable {

  var _id  : String?
  var vehicleTypeName : String?
  var vehicleTypeImg : String?
  var companyName : String?
  var companyImg : String?
  var active : String?
  var createdAt : String?
  var updatedAt : String?
  var __v : String?
  init?(map: Map) {

  }

  mutating func mapping(map: Map) {

    _id <- map["_id"]
    vehicleTypeName <- map["vehicleTypeName"]
    vehicleTypeImg <- map["vehicleTypeImg"]
    active <- map["active"]
    createdAt <- map["createdAt"]
    updatedAt <- map["updatedAt"]
    companyName <- map["companyName"]
    companyImg <- map["companyImg"]
    __v <- map["__v"]

  }
}


struct getSubCat : Mappable {
  var data : [GetSubCatData]?
  var success : Bool?
  var message : String?

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {

    data <- map["data"]
    success <- map["success"]
    message <- map["message"]
  }

}

struct GetSubCatData : Mappable {
  var _id : String?
  var categoryId : CategoryId?
  var subCategoryName : String?
  var status : Bool?
  var createdAt : String?
  var updatedAt : String?
  var __v : Int?

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {

    _id <- map["_id"]
    categoryId <- map["categoryId"]
    subCategoryName <- map["subCategoryName"]
    status <- map["status"]
    createdAt <- map["createdAt"]
    updatedAt <- map["updatedAt"]
    __v <- map["__v"]
  }

}

struct CategoryId : Mappable {
  var _id : String?
  var companyName : String?
  var companyImg : String?
  var active : Bool?
  var createdAt : String?
  var updatedAt : String?
  var __v : Int?

  init?(map: Map) {

  }

  mutating func mapping(map: Map) {

    _id <- map["_id"]
    companyName <- map["companyName"]
    companyImg <- map["companyImg"]
    active <- map["active"]
    createdAt <- map["createdAt"]
    updatedAt <- map["updatedAt"]
    __v <- map["__v"]
  }

}
