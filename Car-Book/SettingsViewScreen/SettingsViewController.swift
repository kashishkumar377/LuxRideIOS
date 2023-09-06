//
//  SettingsViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var tblSettings: UITableView!
    @IBOutlet var heightTblSettings: NSLayoutConstraint!
    var arrSettings = ["Notification","Account", "Delete Account", "Privacy Policy" ,"Terms and Condition", "App Info" ,"Contact Support" , "Legal" , "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        heightTblSettings.constant = CGFloat((arrSettings.count * 55))
        tblSettings.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
