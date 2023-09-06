//
//  ChangeEmailViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class ChangeEmailViewController: UIViewController {

    @IBOutlet var viewMain: UIView!
    @IBOutlet var viewEmail: UIView!
    @IBOutlet var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMain.layer.cornerRadius = 10
        viewEmail.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10
        
        viewMain.layer.borderWidth = 1.0
        viewEmail.layer.borderWidth = 1.0
        
        viewEmail.layer.borderColor = Constant.color.borderColor
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
