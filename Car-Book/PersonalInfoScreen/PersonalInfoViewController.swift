//
//  PersonalInfoViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class PersonalInfoViewController: UIViewController {

    @IBOutlet var viewPhoneNo: UIView!
    @IBOutlet var viewDLNo: UIView!
    @IBOutlet var viewNinNo: UIView!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewPhoneNo.layer.cornerRadius = 10
        viewDLNo.layer.cornerRadius = 10
        viewNinNo.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
       
        viewPhoneNo.layer.borderWidth = 1.0
        viewPhoneNo.layer.borderColor =  Constant.color.borderColor
        viewDLNo.layer.borderWidth = 1.0
        viewDLNo.layer.borderColor =  Constant.color.borderColor
        viewNinNo.layer.borderWidth = 1.0
        viewNinNo.layer.borderColor =  Constant.color.borderColor
    }
    
    @IBAction func onBtnNextClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "LicenseViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
