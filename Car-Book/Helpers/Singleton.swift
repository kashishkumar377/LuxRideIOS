//
//  Singleton.swift
//
//
//  Created by Dev's on 15/05/21.
//

import UIKit
import Foundation



class UserStoreSingleton: NSObject{
    static let shared = UserStoreSingleton()
    private override init() {}

    var userlat: Double?
    var userLong: Double?



    var usercurrentAddress : String?


    var isLoggedIn : Bool?{
        get{
            return (UserDefaults().object(forKey: "isLoggedIn") as? Bool)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "isLoggedIn")
        }
    }
    var userType : String?{
        get{
            return (UserDefaults().object(forKey: "userType") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "userType")
        }
    }

    var is_profile_completed : Bool?{
        get{
            return (UserDefaults().object(forKey: "is_profile_completed") as? Bool)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "is_profile_completed")
        }
    }
    var is_Come_FromSocial : Bool?{
        get{
            return (UserDefaults().object(forKey: "is_Come_FromSocial") as? Bool)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "is_Come_FromSocial")
        }
    }


    var userToken : String?{
        get{
            return (UserDefaults().object(forKey: "userToken") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "userToken")
        }
    }
    var phoneNumer : String?{
        get{
            return (UserDefaults().object(forKey: "phoneNumer") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "phoneNumer")
        }
    }
    var SuccessStatus : Int?{
        get{
            return (UserDefaults().object(forKey: "SuccessStatus") as? Int)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "SuccessStatus")
        }
    }

    var profileImage : String?{
        get{
            return (UserDefaults().object(forKey: "profileImage") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "profileImage")
        }
    }
    var name : String?{
        get{
            return (UserDefaults().object(forKey: "name") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "name")
        }
    }

    var Locationaddress : String?{
        get{
            return (UserDefaults().object(forKey: "Locationaddress") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "Locationaddress")
        }
    }

    var userID : Int?{
        get{
            return (UserDefaults().object(forKey: "userID") as? Int)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "userID")
        }
    }

    var currentLat : Double?{
        get{
            return (UserDefaults().object(forKey: "currentLat") as? Double)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "currentLat")
        }
    }
    var currentLong : Double?{
        get{
            return (UserDefaults().object(forKey: "currentLong") as? Double)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "currentLong")
        }
    }


    var fcmToken : String?{
        get{
            return (UserDefaults().object(forKey: "fcmToken") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "fcmToken")
        }
    }


    var PostalCode : String?{
        get{
            return (UserDefaults().object(forKey: "PostalCode") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "PostalCode")
        }
    }

    var Address : String?{
        get{
            return (UserDefaults().object(forKey: "Address") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "Address")
        }
    }
   
    var driverEnable : Bool?{
        get{
            return (UserDefaults().object(forKey: "driverEnable") as? Bool)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "driverEnable")
        }
    }
    var is24HourFormat : Bool?{
        get{
            return (UserDefaults().object(forKey: "is24HourFormat") as? Bool)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "is24HourFormat")
        }
    }
    var isPayPal : Bool?{
        get{
            return (UserDefaults().object(forKey: "isPayPal") as? Bool)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "isPayPal")
        }
    }
    var appleEmail : String?{
        get{
            return (UserDefaults().object(forKey: "appleEmail") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "appleEmail")
        }
    }
    var selectUIColor : String?{
        get{
            return (UserDefaults().object(forKey: "selectUIColor") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "selectUIColor")
        }
    }
    var brokerageType : String?{
        get{
            return (UserDefaults().object(forKey: "brokerageType") as? String)
        }set{
            UserDefaults.standard.setValue(newValue, forKey: "brokerageType")
        }
    }
}
