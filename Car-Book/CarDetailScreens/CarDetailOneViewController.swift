//
//  CarDetailOneViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit
import GoogleMaps
import CoreLocation
import GooglePlaces

class CarDetailOneViewController: BaseClassVC, SelectionListVCsDelegate {



  @IBOutlet weak var listlPickerview: UIPickerView!
  @IBOutlet var viewTrim: UIView!
    @IBOutlet var viewCar: UIView!
    @IBOutlet var viewCarYear: UIView!
    @IBOutlet var viewCarMake: UIView!
    @IBOutlet var viewCarPlateNo: UIView!
    @IBOutlet var viewCarTrim: UIView!
    @IBOutlet var viewCarColor: UIView!
    @IBOutlet weak var lblCarLocated: UILabel!
    @IBOutlet var btnNext: UIButton!
    @IBOutlet weak var lblPlateNumber: UILabel!
    @IBOutlet weak var lblTrim: UILabel!

  @IBOutlet weak var txtfldCarDo: UITextField!
  @IBOutlet weak var txtAddress: UITextField!
  @IBOutlet weak var txtfldMake: UITextField!
  @IBOutlet weak var txtfldColor: UITextField!
  @IBOutlet weak var txtfldYear: UITextField!
  @IBOutlet weak var txtfldCarModel: UITextField!

  @IBOutlet weak var txtfldTrim: UITextField!
  @IBOutlet weak var txtfldVin: UITextField!

  @IBOutlet weak var lblPlate: UILabel!
  @IBOutlet weak var lblColor: UILabel!
  @IBOutlet weak var lblMake: UILabel!
  @IBOutlet weak var lblYear: UILabel!
  @IBOutlet weak var lblcarDo: UILabel!
  var years = [String]()
  override func viewDidLoad() {
        super.viewDidLoad()
      tabBarController?.tabBar.isHidden = true

      updateUI()
    }

    func updateUI() {
      self.listlPickerview.isHidden = true
        viewCar.layer.cornerRadius = 10
        viewTrim.layer.cornerRadius = 10
        viewCarYear.layer.cornerRadius = 10
        viewCarMake.layer.cornerRadius = 10
        viewCarPlateNo.layer.cornerRadius = 10
        viewCarTrim.layer.cornerRadius = 10
        viewCarColor.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10

        viewCar.layer.borderWidth = 1.0
        viewTrim.layer.borderWidth = 1.0
        viewCar.layer.borderColor =  Constant.color.borderColor
        viewCarYear.layer.borderWidth = 1.0
        viewCarYear.layer.borderColor =  Constant.color.borderColor

        viewCarMake.layer.borderWidth = 1.0
        viewCarMake.layer.borderColor =  Constant.color.borderColor

        viewCarPlateNo.layer.borderWidth = 1.0
        viewCarPlateNo.layer.borderColor =  Constant.color.borderColor
      viewTrim.layer.borderColor =  Constant.color.borderColor
        viewCarTrim.layer.borderWidth = 1.0
        viewCarTrim.layer.borderColor =  Constant.color.borderColor

        viewCarColor.layer.borderWidth = 1.0
        viewCarColor.layer.borderColor =  Constant.color.borderColor
    }
  func yearPicker(){
     //carTypeArr.removeAll()
      let format = DateFormatter()
      format.dateFormat = "yyyy"
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd"

      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM dd,yyyy"

      let date: Date? = dateFormatterGet.date(from: "2017-02-14")
      print(dateFormatter.string(from: date!))

      var yearsTillNow : [String] {

          for i in (1937..<2023).reversed() {
              years.append("\(i)")
             // listlPickerview.reloadData()
          }
          return years
      }
      print("yearsTillNow",yearsTillNow)
     }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

  func getSelectedValue(value:String,type:String) {
    let getVV = value
     print(getVV)
    if type == "Year" {
      txtfldYear.text = value
    }else if type == "Color" {
      txtfldColor.text = value
    }else if type == "Category" {
      txtfldCarDo.text = value
    }else if type == "Make" {
      txtfldMake.text = value
    }else if type == "Model" {
      txtfldCarModel.text = value
    }else if type == "Trim" {
      txtfldTrim.text = value
    }else{
      txtfldCarModel.text = value
    }

  }

  func getSelectedColorValue(value: String, screen: String, type: String) {
    txtfldColor.backgroundColor = hexStringToUIColor(hex: value)
  }


  //MARK: ------ Location Change
  @IBAction func actionLocation(_ sender: Any) {
          let acController = GMSAutocompleteViewController()
          acController.delegate = self
          self.present(acController, animated: true, completion: nil)
    }

  @IBAction func actionList(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Category"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)

  }

  @IBAction func actionMake(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Make"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

  @IBAction func actionModel(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Model"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

  @IBAction func actionTrim(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Trim"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

  @IBAction func actionColor(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.tableType = "Color"
    targetVC?.delegateRef = self
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

  @IBAction func actionYearList(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.tableType = "Year"
    targetVC?.delegateRef = self
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)

  }

    @IBAction func onBtnBackClicked(_ sender: UIButton) {
      self.tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func onBtnNextClicked(_ sender: UIButton) {
      let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
      let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailTwoViewController")
      self.navigationController?.pushViewController(targetVC, animated: true)
    }


   func hexStringToUIColor (hex:String) -> UIColor {
      var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

      if (cString.hasPrefix("#")) {
          cString.remove(at: cString.startIndex)
      }

      if ((cString.count) != 6) {
          return UIColor.gray
      }

      var rgbValue:UInt64 = 0
      Scanner(string: cString).scanHexInt64(&rgbValue)

      return UIColor(
          red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
          green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
          blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
          alpha: CGFloat(1.0)
      )
  }
}


//MARK: ---GMSAutocompleteViewControllerDelegate,GMSMapViewDelegate
extension CarDetailOneViewController :  GMSAutocompleteViewControllerDelegate,GMSMapViewDelegate  {
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        self.dismiss(animated: true, completion: nil)
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        self.dismiss(animated: true, completion: nil)
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        let lat = place.coordinate.latitude
        let long = place.coordinate.longitude
        print("Place address: \(place.formattedAddress ?? "null")")
        print("Place lat: \(lat)")
        print("Place long: \(long)")
        //self.txt_Country.text = place.formattedAddress
        print("Place attributions: \(String(describing: place.attributions))")

        txtAddress.text = place.formattedAddress
       self.dismiss(animated: true, completion: nil)
    }
}

extension CarDetailOneViewController : UIPickerViewDelegate,UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }


  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
      return years.count
  }

  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
      return years[row]
  }

  func pickerView(_ pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int){
      txtfldYear.text = years[row]
      self.view.endEditing(true)
  }
}
