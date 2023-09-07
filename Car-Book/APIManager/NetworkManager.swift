//
//  NetworkManager.swift
//  Contract Us
//
//  Created by Pankaj on 29/06/22.
//

import Foundation
import Alamofire
import SwiftUI

class NetworkManager: NSObject {
    
    static var sessionManager:Session = {
        let sesionManager = Session.default
        return sesionManager
    }()
    

    class func sendRequest(urlPath:String, type:HTTPMethod, parms:[String:Any]?, success:((_ responseObject:[String : Any],_ suces:Bool)->Void)!, faliure:((_ errMsg:String,_ errCode:Int)->Void)!) {
        
        if NetworkReachabilityManager()!.isReachable == false {
            
            faliure(Constant.ValidationMessages.internetAppearOffline,Constant.APIResponseCodes.statusCodeInternetNotAvailable)
            return
        }
        
        
        var request = URLRequest.init(url:URL.init(string: urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
    
        let header = self.getJSONXAPiKey()
        request.httpMethod = type.rawValue
     
        if !parms!.isEmpty {
            let postString = self.getPostString(params: parms!)
            request.httpBody = postString.data(using: .utf8)
        }
        request.allHTTPHeaderFields = header
        print("APIURL-----------------",urlPath)
        print("PARAMS---------------------",parms!)
        print("header---------------------",header)
   
        AF.request(request).responseJSON { response in
            
            switch response.result {
            case .success:
                print(response)
                if let responseObj:[String:Any] = response.value as? [String : Any] {
                    success(responseObj,true)
                } else {
                    faliure("Invalid Response", response.response?.statusCode ?? Constant.APIResponseCodes.statusCodeInternalServerError)
                }
                break
            case .failure(let error):
                faliure(error.localizedDescription , Constant.APIResponseCodes.statusCodeInternalServerError)
                print(error)
            }
        }
        
        
    }
  
    
    class func getPostString(params:[String:Any]) -> String
       {
           var data = [String]()
           for(key, value) in params
           {
               data.append(key + "=\(value)")
           }
           return data.map { String($0) }.joined(separator: "&")
       }
    
    
    class func sendRequestRestAPi(urlPath:String, type:HTTPMethod, parms:Parameters?, success:((_ responseObject:[[String : Any]],_ suces:Bool)->Void)!, faliure:((_ errMsg:String,_ errCode:Int)->Void)!) {
        print(parms as Any)
         if NetworkReachabilityManager()!.isReachable == false {
             faliure(Constant.ValidationMessages.internetAppearOffline, -1009)
             return
         }
         
         var request = URLRequest.init(url:URL.init(string: urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
        // let headers = ["Content-Type": "application/json"]
         let header = self.getJSONXAPiKey()
     
       
         request.httpMethod = type.rawValue
         if !parms!.isEmpty {
             request.httpBody = try? JSONSerialization.data(withJSONObject: parms ?? [:])
         }
         request.allHTTPHeaderFields = header
        print(header,"HEADER-----__________-----------")
         print(urlPath,"URLPATH------_______--------")
         print(parms,"PARAMS-------_______________")
        AF.request(request).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                if let responseObj:[[String:Any]] = response.value as? [[String : Any]] {
                    success(responseObj,true)
                } else {
                    faliure("Invalid Response", response.response?.statusCode ?? Constant.APIResponseCodes.statusCodeInternalServerError)
                }
                break
            case .failure(let error):
                faliure(error.localizedDescription , response.response?.statusCode ?? Constant.APIResponseCodes.statusCodeInternalServerError)
                print(error)
            }
        }
     }
    
    static func getJSONHeaderWithAcceesToken() -> [String:String] {
        let token = UserDefaults.standard.value(forKey: "token") as? String ?? "Nil"
        return ["Authorization": "Bearer \(token)"]
        
                
    }
    
    static func getJSONXAPiKey() -> [String:String] {
        return ["Content-Type": "application/x-www-form-urlencoded"]
        
    }
    
    class func uploadTo(_ isImg:Bool,imgVw:Data?,urlPath:String, paramName:String , param: [String : Any] , fileType:String ,success:((_ fileName:[String: Any]?,_ suces:Bool)->Void)!, faliure:((_ errCode:Int,_ errMsg:String)->Void)!) {
        let token = UserDefaults.standard.value(forKey: "token") as? String ?? "Nil"
        let headers: HTTPHeaders = [
//            "Content-Type":"application/json",
            "Authorization": "Bearer \(token)"
        ]
        
        let requestURL:URLConvertible = urlPath
        print(urlPath,"-________------------")
        AF.upload(
            multipartFormData: { formData in
                if isImg {
                    let imageData = imgVw
                    print(imageData ?? Data(),"\(Date().timeIntervalSince1970).jpg","PARAM")
                    formData.append(imageData!, withName: paramName, fileName: "\(Date().timeIntervalSince1970).jpg", mimeType: "image/jpg")
                }
               
                
                for (key, value) in param {
                    print(key,value)
                    formData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: requestURL, //URL Here
            method: .post,
            headers: headers)
            .responseJSON { (uploadResult) in
                print(paramName)
                switch uploadResult.result{
                case .failure(let error):
                    print(error)
                    faliure(401,error.localizedDescription)
                case.success( _):
                    if  uploadResult.response?.statusCode == 200 || uploadResult.response?.statusCode == 201 {
                           if let response : [String:Any] = uploadResult.value as? [String:Any] {
                              success(response,true)
                           } else {
                            success(nil,true)
                        }
                      
                    }
                        
                    else if uploadResult.response?.statusCode == 500 {
                        faliure(500,"")
                    }
                    
                    else {
                        if uploadResult.value == nil {
                            faliure(500,"")
                            return
                        }
                        print("error response value \(String(describing: uploadResult.value))")
                        if let val : [String:Any] = uploadResult.value as? [String:Any] {
                            faliure(500,val["message"] as? String ?? "Something went wrong")
                        }
                        else {
                            faliure(500,"")
                        }
                    }
                    break
                }
                print("resp is \(uploadResult)")
        }
    }
    
    
    class func upload(urlPath:String, data:[Data]?, paramName:String , param: [String : Any] , fileType:String ,success:((_ fileName:[String: Any]?,_ suces:Bool)->Void)!, faliure:((_ errCode:Int)->Void)!) {
        let token = UserDefaults.standard.value(forKey: "token") as? String ?? "Nil"
        let headers: HTTPHeaders = [
//            "Content-Type":"application/json",
            "Authorization": "Bearer \(token)"
        ]

        
       

        let requestURL:URLConvertible = urlPath

        AF.upload(
            multipartFormData: { formData in
                
                    for i in 0..<data!.count {
                        if i == 0 {
                            formData.append(data![0], withName:"profile_pic", fileName:"\(Date().timeIntervalSince1970).jpg", mimeType:"image/png")
                        }  else {
                            formData.append(data![1], withName:"cover_image", fileName:"\(Date().timeIntervalSince1970).jpg", mimeType:"image/png")
                        
                        
                    }
                }
                for (key, value) in param {
                    formData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            }, to: requestURL, //URL Here
            method: .post,
            headers: headers)
            .responseJSON { (uploadResult) in
                print(paramName)
                switch uploadResult.result{
                case .failure(let error):
                    print(error)
                    faliure(401)
                case.success( _):
                    if uploadResult.response?.statusCode == 200 || uploadResult.response?.statusCode == 201 {
                           if let response : [String:Any] = uploadResult.value as? [String:Any] {
                              success(response,true)
                           } else {
                            success(nil,true)
                        }

                    }

                    else if uploadResult.response?.statusCode == 500 {
                        faliure(500)
                    }

                    else {
                        if uploadResult.value == nil {
                            faliure(500)
                            return
                        }
                        print("error response value \(String(describing: uploadResult.value))")
                        if let _ : [String:Any] = uploadResult.value as? [String:Any] {
                            faliure(500)
                        }
                        else {
                            faliure(500)
                        }
                    }
                    break
                }
                print("resp is \(uploadResult)")
        }

    }
    
    class func isConnectedToNetwork() -> Bool {
        if NetworkReachabilityManager()!.isReachable {
            return true
        } else {
            return false
        }
    }
    

    
    class func sendGoogleAPiReq(urlPath:String, type:HTTPMethod, parms:Parameters?,header:HTTPHeaders, success:((_ responseObject:[String : Any],_ suces:Bool)->Void)!, faliure:((_ errMsg:String,_ errCode:Int)->Void)!) {
        
        if NetworkReachabilityManager()!.isReachable == false {
            faliure(Constant.ValidationMessages.internetAppearOffline, -1009)
            return
        }
        
        var request = URLRequest.init(url:URL.init(string: urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!)
       // let headers = ["Content-Type": "application/json"]
     
        request.httpMethod = type.rawValue
        /*if !parms!.isEmpty {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parms ?? [:])
        }*/
        request.allHTTPHeaderFields = header.dictionary
        print(urlPath)
     
    }
}

