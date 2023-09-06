//
//  ContactSupportViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class ContactSupportViewController: UIViewController {
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var viewTitle: UIView!
    @IBOutlet var viewEmail: UIView!
    @IBOutlet var viewDescription: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSubmit.layer.cornerRadius = 10
        viewTitle.layer.cornerRadius = 10
        viewEmail.layer.cornerRadius = 10
        
        viewEmail.layer.borderWidth = 1.0
        viewEmail.layer.borderColor = Constant.color.borderColor
        viewDescription.layer.cornerRadius = 10
        
        viewTitle.layer.borderWidth = 1.0
        viewTitle.layer.borderColor = Constant.color.borderColor
        viewDescription.layer.cornerRadius = 10
        
        viewDescription.layer.borderWidth = 1.0
        viewDescription.layer.borderColor = Constant.color.borderColor
        viewDescription.layer.cornerRadius = 10
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
