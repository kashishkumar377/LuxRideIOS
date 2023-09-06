//
//  LicenseViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 21/08/23.
//

import UIKit

class LicenseViewController: UIViewController {
    
    @IBOutlet var viewFirstName: UIView!
    @IBOutlet var viewMiddleName: UIView!
    @IBOutlet var viewLastName: UIView!
    @IBOutlet var viewCountry: UIView!
    @IBOutlet var viewCity: UIView!
    @IBOutlet var viewLicenseNo: UIView!
    @IBOutlet var viewDOB: UIView!
    @IBOutlet var viewExpDate: UIView!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewFirstName.layer.cornerRadius = 10
        viewMiddleName.layer.cornerRadius = 10
        viewLastName.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
        viewCountry.layer.cornerRadius = 10
        viewLicenseNo.layer.cornerRadius = 10
        viewDOB.layer.cornerRadius = 10
        viewExpDate.layer.cornerRadius = 10
       
        viewFirstName.layer.borderWidth = 1.0
        viewFirstName.layer.borderColor =  Constant.color.borderColor
        
        viewCountry.layer.borderWidth = 1.0
        viewCountry.layer.borderColor =  Constant.color.borderColor
        
        viewLastName.layer.borderWidth = 1.0
        viewLastName.layer.borderColor =  Constant.color.borderColor
        
        viewMiddleName.layer.borderWidth = 1.0
        viewMiddleName.layer.borderColor =  Constant.color.borderColor
        
        viewLicenseNo.layer.borderWidth = 1.0
        viewLicenseNo.layer.borderColor =  Constant.color.borderColor
        
        viewDOB.layer.borderWidth = 1.0
        viewDOB.layer.borderColor =  Constant.color.borderColor
        
        viewExpDate.layer.borderWidth = 1.0
        viewExpDate.layer.borderColor =  Constant.color.borderColor
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnNextClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailOneViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
   

}
