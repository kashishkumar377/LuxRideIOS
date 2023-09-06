//
//  ChangePasswordViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var viewCurrentPwd: UIView!
    @IBOutlet var viewNewPwd: UIView!
    @IBOutlet var viewNewReturnPwd: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSubmit.layer.cornerRadius = 10
        viewNewPwd.layer.cornerRadius = 10
        viewCurrentPwd.layer.cornerRadius = 10
        
        viewCurrentPwd.layer.borderWidth = 1.0
        viewCurrentPwd.layer.borderColor = UIColor.clear.cgColor
        viewCurrentPwd.layer.borderColor = Constant.color.borderColor
        
        viewNewPwd.layer.borderWidth = 1.0
        viewNewPwd.layer.borderColor = Constant.color.borderColor
        
        viewNewReturnPwd.layer.cornerRadius = 10
        viewNewReturnPwd.layer.borderWidth = 1.0
        viewNewReturnPwd.layer.borderColor = Constant.color.borderColor
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
