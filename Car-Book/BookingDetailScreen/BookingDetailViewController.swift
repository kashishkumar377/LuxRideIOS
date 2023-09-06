//
//  BookingDetailViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 21/08/23.
//

import UIKit

class BookingDetailViewController: UIViewController {

    @IBOutlet var viewName: UIView!
    @IBOutlet var viewMobileNo: UIView!
    @IBOutlet var viewCountry: UIView!
    @IBOutlet var viewState: UIView!
    @IBOutlet var viewLicenseNo: UIView!
    @IBOutlet var viewDOB: UIView!
    @IBOutlet var viewExpDate: UIView!
    @IBOutlet var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewName.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10
        viewMobileNo.layer.cornerRadius = 10
        viewCountry.layer.cornerRadius = 10
        viewState.layer.cornerRadius = 10
        viewLicenseNo.layer.cornerRadius = 10
        viewDOB.layer.cornerRadius = 10
        viewExpDate.layer.cornerRadius = 10
       
        viewName.layer.borderWidth = 1.0
        viewName.layer.borderColor =  Constant.color.borderColor
        
        viewMobileNo.layer.borderWidth = 1.0
        viewMobileNo.layer.borderColor =  Constant.color.borderColor
        
        viewCountry.layer.borderWidth = 1.0
        viewCountry.layer.borderColor =  Constant.color.borderColor
        
        viewMobileNo.layer.borderWidth = 1.0
        viewMobileNo.layer.borderColor =  Constant.color.borderColor
        
        viewState.layer.borderWidth = 1.0
        viewState.layer.borderColor =  Constant.color.borderColor
        
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

}
