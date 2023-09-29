//
//  AppDelegate.swift
//  Car-Book
//
//  Created by Devgan on 14/08/23.
//

import UIKit
import CoreData
import GoogleMaps
import IQKeyboardManagerSwift
//import FirebaseAuth

import GoogleSignIn
import KeychainSwift
import FacebookCore
import GoogleMaps
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

  var window : UIWindow?
  var locationManager = CLLocationManager()
  var isLocationFetched = false
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
    IQKeyboardManager.shared.enable = true
    IQKeyboardManager.shared.enableAutoToolbar = true
    GMSServices.provideAPIKey("AIzaSyDGjR7kqAFRiZ6hVluT9LhshR7_wvqOEug")
   // GMSPlacesClient.provideAPIKey("AIzaSyBq16ekrXE3LHeDIwu3KDk0O9s-rMjZpqc")
    GMSPlacesClient.provideAPIKey("AIzaSyDGjR7kqAFRiZ6hVluT9LhshR7_wvqOEug")
    GMSServices.provideAPIKey("AIzaSyDGjR7kqAFRiZ6hVluT9LhshR7_wvqOEug")


    configureTabbar()
    return true
  }

  func application( _ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool {
      var handled: Bool

      handled = ((GIDSignIn.sharedInstance.handle(url)) != nil)
      if handled {
          return true
      }

      return false
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
  
  }

  // MARK: - Core Data stack

  lazy var persistentContainer: NSPersistentCloudKitContainer = {

      let container = NSPersistentCloudKitContainer(name: "Car_Book")
      container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {

              fatalError("Unresolved error \(error), \(error.userInfo)")
          }
      })
      return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
      let context = persistentContainer.viewContext
      if context.hasChanges {
          do {
              try context.save()
          } catch {

              let nserror = error as NSError
              fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
          }
      }
  }

}

extension AppDelegate {


  func configureTabbar(){
    if UserStoreSingleton.shared.isLoggedIn == true{
      let delegate = UIApplication.shared.delegate as? AppDelegate
      let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
      let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
      let nav = UINavigationController(rootViewController: targetVC)
      nav.setNavigationBarHidden(true, animated: true)
      delegate?.window?.rootViewController = nav
      self.window?.rootViewController = nav
      window?.makeKeyAndVisible()


    }else{

      let delegate = UIApplication.shared.delegate as? AppDelegate
      let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
      let targetVC = sb.instantiateViewController(withIdentifier: "GetStartedViewController")
      let nav = UINavigationController(rootViewController: targetVC)
      nav.setNavigationBarHidden(true, animated: true)
      delegate?.window?.rootViewController = nav
      self.window?.rootViewController = nav
      window?.makeKeyAndVisible()
    }
  }
}


//https://www.google.co.in/
extension AppDelegate{

    func determineMyCurrentLocation(){
        DispatchQueue.main.async {
            self.locationManager = CLLocationManager()
            self.locationManager.delegate = self as CLLocationManagerDelegate
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            if  #available(iOS 14.0, *){
                self.locationManager.pausesLocationUpdatesAutomatically = false
            }
            self.locationManager.requestAlwaysAuthorization()
            DispatchQueue.global().async {
                if CLLocationManager.locationServicesEnabled(){
                    self.locationManager.startUpdatingLocation()
                }
            }
            if #available(iOS 14.0, *) {
                if self.locationManager.authorizationStatus == .notDetermined {
                    self.locationManager.requestWhenInUseAuthorization()
                }
            }else{
            }
        }
    }

    func fetchCurrentLocation(_ application: UIApplication){
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                print("NotDetermined")
                self.determineMyCurrentLocation()
                break
            case .restricted, .denied:
                print("No access")
                let alert = UIAlertController(title: "LuxeRide", message: "Please go to Settings > Gifts > Location > Enable Location While Using the App", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Settings", style: UIAlertAction.Style.default, handler: { action in
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    }
                }))
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                let vc = UIViewController()
             //   LocationFunc = true
                vc.present(alert, animated: true, completion: nil)
                break
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                break
            @unknown default:
                print("error")
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        print(userLocation.coordinate)
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        UserStoreSingleton.shared.userlat = userLocation.coordinate.latitude
        UserStoreSingleton.shared.userLong = userLocation.coordinate.longitude
        manager.stopUpdatingLocation()
        DispatchQueue.main.async {
            if(!self.isLocationFetched) {
                self.isLocationFetched = true
                let latitude = String(format:"%.8f", userLocation.coordinate.latitude)
                let longitude = String(format:"%.8f", userLocation.coordinate.longitude)


                let locations = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
              //  self.getAddressFromCoordinates(location: locations)
               // self.latLong(lat: userLocation.coordinate.latitude, long: userLocation.coordinate.longitude)
            }
        }
    }
//    func latLong(lat: Double,long: Double)  {
//
//       let geoCoder = CLGeocoder()
//        let location = CLLocation(latitude:UserStoreSingleton.shared.userlat ?? 0.0, longitude: UserStoreSingleton.shared.userLong ?? 0.0)
//       geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//
//           print("Response GeoLocation : \(placemarks)")
//           var placeMark: CLPlacemark!
//           placeMark = placemarks?[0]
//
//           // Country
//           if let country = placeMark.addressDictionary!["Country"] as? String {
//               print("Country :- \(country)")
//               // City
//               if let city = placeMark.addressDictionary!["City"] as? String {
//                   print("City :- \(city)")
//                   // State
//                   if let state = placeMark.addressDictionary!["State"] as? String{
//                       print("State :- \(state)")
//                       // Street
//                       if let street = placeMark.addressDictionary!["Street"] as? String{
//                           print("Street :- \(street)")
//                           let str = street
//                           let streetNumber = str.components(
//                               separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
//                           print("streetNumber :- \(streetNumber)" as Any)
//
//                           // ZIP
//                           if let zip = placeMark.addressDictionary!["ZIP"] as? String{
//                               print("ZIP :- \(zip)")
//                               // Location name
//                               if let locationName = placeMark?.addressDictionary?["Name"] as? String {
//                                   print("Location Name :- \(locationName)")
//                                   // Street address
//                                   if let thoroughfare = placeMark?.addressDictionary!["Thoroughfare"] as? NSString {
//                                   print("Thoroughfare :- \(thoroughfare)")
//                                       UserStoreSingleton.shared.usercurrentAddress = "\(city),\(state)\(zip),\(country)"
//                                   }
//                               }
//                           }
//                       }
//                   }
//               }
//           }
//       })
//   }

    func getAddressFromCoordinates(location: CLLocationCoordinate2D){
        let geocode = GMSGeocoder()
        geocode.reverseGeocodeCoordinate(location){
            (response,error) in
            if let CurrnetAddress = response?.firstResult(){
                let addressStr = CurrnetAddress.lines?.joined(separator: ",")
                switch CurrnetAddress.country! {
                case "India":
                    print(CurrnetAddress)
                case "United States":
                    print(CurrnetAddress)
                case "Australia":
                    print(CurrnetAddress)
                default:
                    print("defalt",addressStr as Any)
                }
                var place = ""
                if CurrnetAddress.locality != nil{
                    place = CurrnetAddress.locality ?? ""

                  //  Singleton.sharedInstance.address = addressStr!
                 //   UserStoreSingleton.shared.usercurrentAddress = addressStr

                }
                if CurrnetAddress.subLocality != nil{
                    place = CurrnetAddress.subLocality ?? ""

                }
            }
        }
        self.locationManager.stopUpdatingLocation()
    }

    @available(iOS 14.0, *)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        let accuracyAuthorization = manager.accuracyAuthorization
        switch accuracyAuthorization {
        case .fullAccuracy:
            break
        case .reducedAccuracy:
            manager.requestTemporaryFullAccuracyAuthorization(withPurposeKey: "ForDelivery")
            break
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print("Error \(error)")
    }
}
