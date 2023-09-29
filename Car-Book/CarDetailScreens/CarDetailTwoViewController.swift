//
//  CarDetailTwoViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class CarDetailTwoViewController: BaseClassVC,SelectionListVCsDelegate {



  @IBOutlet var viewVinNo: UIView!
  @IBOutlet var viewDoor: UIView!
  @IBOutlet var viewSeats: UIView!
  @IBOutlet var viewFuelType: UIView!
  @IBOutlet var viewCarModel: UIView!
  @IBOutlet weak var viewOdo: UIView!
  @IBOutlet var viewCarEngine: UIView!
  @IBOutlet var btnNext: UIButton!
  @IBOutlet weak var txtfldPlateNo: UITextField!
  @IBOutlet weak var txtfldDoor: UITextField!
  @IBOutlet weak var txtfldSeat: UITextField!
  @IBOutlet weak var txtfldFuel: UITextField!
  @IBOutlet weak var txtfldMiles: UITextField!

  @IBOutlet weak var txtffldOdometer: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }

  func updateUI() {
    viewVinNo.layer.cornerRadius = 10
    viewDoor.layer.cornerRadius = 10
    viewSeats.layer.cornerRadius = 10
    viewFuelType.layer.cornerRadius = 10
    viewOdo.layer.cornerRadius = 10
    viewCarEngine.layer.cornerRadius = 10
    btnNext.layer.cornerRadius = 10

    viewVinNo.layer.borderWidth = 1.0
    viewVinNo.layer.borderColor =  Constant.color.borderColor

    viewDoor.layer.borderWidth = 1.0
    viewDoor.layer.borderColor =  Constant.color.borderColor

    viewSeats.layer.borderWidth = 1.0
    viewSeats.layer.borderColor =  Constant.color.borderColor

    viewFuelType.layer.borderWidth = 1.0
    viewFuelType.layer.borderColor =  Constant.color.borderColor

    viewOdo.layer.borderWidth = 1.0
    viewOdo.layer.borderColor =  Constant.color.borderColor

    viewCarEngine.layer.borderWidth = 1.0
    viewCarEngine.layer.borderColor =  Constant.color.borderColor
  }

  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.isHidden = true
  }

  func getSelectedValue(value: String, type: String) {
    if type == "Fuel" {
      txtfldFuel.text = value
    }else if type == "Door" {
      txtfldDoor.text = value
    }else if type == "Seat" {
      txtfldSeat.text = value
    }else if type == "Miles" {
      txtfldMiles.text = value
    }else if type == "Odo" {
      txtffldOdometer.text = value
    }else{

    }
  }

  @IBAction func onBtnBackClicked(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }

  @IBAction func onBtnNextClicked(_ sender: UIButton) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailThreeViewController")
    self.navigationController?.pushViewController(targetVC, animated: true)
  }

  @IBAction func actionDoors(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Door"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }
  @IBAction func actionSeat(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Seat"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

  @IBAction func actionFuel(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Fuel"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

  @IBAction func actionEngine(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Miles"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }
  
  @IBAction func actionOdo(_ sender: Any) {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "CarNameCompaniesVC") as? CarNameCompaniesVC
    targetVC?.delegateRef = self
    targetVC?.tableType = "Odo"
    targetVC?.modalPresentationStyle = .overCurrentContext
    targetVC?.modalTransitionStyle = .crossDissolve
    self.navigationController?.present(targetVC!, animated: true)
  }

}
