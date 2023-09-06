//
//  AccountViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet var tblAccount: UITableView!
    var arrHeader = ["Email","Password", "Mobile Number"]
    var arrDetails = ["johndoe@gmail.com","**************", "456546546"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
