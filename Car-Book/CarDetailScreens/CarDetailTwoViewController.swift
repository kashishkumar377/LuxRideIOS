//
//  CarDetailTwoViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class CarDetailTwoViewController: UIViewController {
    
    @IBOutlet var viewVinNo: UIView!
    @IBOutlet var viewDoor: UIView!
    @IBOutlet var viewSeats: UIView!
    @IBOutlet var viewFuelType: UIView!
    @IBOutlet var viewCarModel: UIView!
    @IBOutlet var viewCarEngine: UIView!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewVinNo.layer.cornerRadius = 10
        viewDoor.layer.cornerRadius = 10
        viewSeats.layer.cornerRadius = 10
        viewFuelType.layer.cornerRadius = 10
        viewCarModel.layer.cornerRadius = 10
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
        
        viewCarModel.layer.borderWidth = 1.0
        viewCarModel.layer.borderColor =  Constant.color.borderColor
        
        viewCarEngine.layer.borderWidth = 1.0
        viewCarEngine.layer.borderColor =  Constant.color.borderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnNextClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailThreeViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
