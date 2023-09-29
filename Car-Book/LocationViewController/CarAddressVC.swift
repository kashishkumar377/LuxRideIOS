//
//  CarAddressVC.swift
//  Car-Book
//
//  Created by Devgan on 21/09/23.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces

class CarAddressVC: BaseClassVC, CLLocationManagerDelegate,UINavigationControllerDelegate {


  @IBOutlet weak var txtfldZipCode: UITextField!
  @IBOutlet weak var txtAddress: UITextField!
  @IBOutlet weak var txtfldCountry: UITextField!
  @IBOutlet weak var txtfldState: UITextField!
  @IBOutlet weak var txtfldcity: UITextField!
  @IBOutlet weak var view3: DesignableView!
  @IBOutlet weak var view1: DesignableView!
  @IBOutlet weak var view2: DesignableView!

  let locationManager = CLLocationManager()
  var resultsViewController: GMSAutocompleteResultsViewController?
  var searchController: UISearchController?
  var placesClient: GMSPlacesClient!

  var latitude = Double()
  var longitude = Double()

  var locManager = CLLocationManager()
  var currentUserLocation: CLLocation!
  var geocode = GMSGeocoder()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tabBarController?.tabBar.isHidden = true
    view1.isHidden = true
    view2.isHidden = true
    view3.isHidden = true
    

    locationManager.delegate = self
    if CLLocationManager.authorizationStatus() == .notDetermined
    {
      locationManager.requestAlwaysAuthorization()
    }
    placesClient = GMSPlacesClient.shared()

  }

  override func viewWillAppear(_ animated: Bool) {
    self.tabBarController?.tabBar.isHidden = true
  }

  //MARK: ------ Location Change
  @IBAction func actionLocation(_ sender: Any) {
    let acController = GMSAutocompleteViewController()
    acController.delegate = self
    let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                              UInt(GMSPlaceField.placeID.rawValue))!
    acController.placeFields = fields

    // Specify a filter.
    let filter = GMSAutocompleteFilter()

    //    acController.autocompleteFilter = filter
    self.present(acController, animated: true, completion: nil)

  }

  @IBAction func onBtnBackClicked(_ sender: UIButton) {
    self.tabBarController?.tabBar.isHidden = false
    self.navigationController?.popViewController(animated: true)
  }

  @IBAction func onBtnNextClicked(_ sender: UIButton) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailOneViewController")
    self.navigationController?.pushViewController(targetVC, animated: true)
  }

  func getAddressFromLatLon(pdblLatitude: Double, withLongitude pdblLongitude: Double) {
    var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
    let lat: Double = Double("\(pdblLatitude)")!
    let lon: Double = Double("\(pdblLongitude)")!
    print(lat)
    print(lon)
    let ceo: CLGeocoder = CLGeocoder()
    center.latitude = lat
    center.longitude = lon
    print(ceo)
    let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
    print(loc)
    ceo.reverseGeocodeLocation(loc, completionHandler:
                                {(placemarks, error) in
      if (error != nil)
      {
        print("reverse geodcode fail: \(error!.localizedDescription)")
      }
      print(placemarks as Any)
      let pm = placemarks! as [CLPlacemark]
      if pm.count > 0 {
        let pm = placemarks![0]
        var addressString : String = ""

        if pm.subLocality != nil {
          addressString =  pm.thoroughfare ?? ""
          self.txtAddress.text = addressString
        }
        if pm.locality != nil {
          addressString =  pm.name!
          self.txtfldState.text = addressString

        }
        if pm.subLocality != nil {
          addressString =  pm.locality ?? ""
          self.txtfldcity.text = addressString
        }
        if pm.country != nil {
          addressString = pm.country ?? ""
          self.txtfldState.text = addressString

        }
        if pm.postalCode != nil {
          addressString =  pm.postalCode ?? ""
          self.txtfldZipCode.text = addressString
        }

        print(addressString)

      }
    })
  }

}

//MARK: - -GMSAutocompleteViewControllerDelegate,GMSMapViewDelegate
extension CarAddressVC :  GMSAutocompleteViewControllerDelegate,GMSMapViewDelegate  {
  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print(error)
    self.dismiss(animated: true, completion: nil)
  }

  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    print("Autocomplete was cancelled.")
    self.dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {

          let lat = place.coordinate.latitude
          let lon = place.coordinate.longitude
          print("Place name: \(String(describing: place.name))")
          print("place.coordinate: \(String(describing: place.coordinate))")
          print("Place attributions: \(String(describing: place.attributions))")
          print("\(lat)\(lon)")
          txtAddress.text = "\(String(describing: place.name ?? ""))"
          getAddressFromCoordinates(location: place.coordinate)
          dismiss(animated: true, completion: nil)
       //   UserLocation.coordinates = place.coordinate
        //  UserLocation.address = place.formattedAddress ?? ""
      }


  func getAddressFromCoordinates(location: CLLocationCoordinate2D){
    geocode.reverseGeocodeCoordinate(location){
      (response,error) in
      if let CurrnetAddress = response?.firstResult(){
        let addressStr = CurrnetAddress.lines?.joined(separator: ",")
        print("addressStr",addressStr)
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
        if CurrnetAddress.thoroughfare != nil{
          self.txtAddress.text = CurrnetAddress.thoroughfare
        }else{
          self.txtAddress.text = addressStr ?? ""
        }
        if CurrnetAddress.locality != nil{
          self.txtfldcity.text = CurrnetAddress.locality ?? ""
        }
        if CurrnetAddress.administrativeArea != nil {
          self.txtfldState.text = CurrnetAddress.administrativeArea ?? ""
        }
        if CurrnetAddress.postalCode != nil {
          self.txtfldZipCode.text = CurrnetAddress.postalCode ?? ""
        }
      }
    }
  }


}
