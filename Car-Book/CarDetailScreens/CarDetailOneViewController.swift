//
//  CarDetailOneViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class CarDetailOneViewController: UIViewController {

    @IBOutlet var viewAddress: UIView!
    @IBOutlet var viewCar: UIView!
    @IBOutlet var viewCarYear: UIView!
    @IBOutlet var viewCarMake: UIView!
    @IBOutlet var viewCarPlateNo: UIView!
    @IBOutlet var viewCarTrim: UIView!
    @IBOutlet var viewCarColor: UIView!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewAddress.layer.cornerRadius = 10
        viewCar.layer.cornerRadius = 10
        viewCarYear.layer.cornerRadius = 10
        viewCarMake.layer.cornerRadius = 10
        viewCarPlateNo.layer.cornerRadius = 10
        viewCarTrim.layer.cornerRadius = 10
        viewCarColor.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
       
        viewAddress.layer.borderWidth = 1.0
        viewAddress.layer.borderColor =  Constant.color.borderColor
        
        viewCar.layer.borderWidth = 1.0
        viewCar.layer.borderColor =  Constant.color.borderColor
        
        viewCarYear.layer.borderWidth = 1.0
        viewCarYear.layer.borderColor =  Constant.color.borderColor
        
        viewCarMake.layer.borderWidth = 1.0
        viewCarMake.layer.borderColor =  Constant.color.borderColor
        
        viewCarPlateNo.layer.borderWidth = 1.0
        viewCarPlateNo.layer.borderColor =  Constant.color.borderColor
        
        viewCarTrim.layer.borderWidth = 1.0
        viewCarTrim.layer.borderColor =  Constant.color.borderColor
        
        viewCarColor.layer.borderWidth = 1.0
        viewCarColor.layer.borderColor =  Constant.color.borderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnNextClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailTwoViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
