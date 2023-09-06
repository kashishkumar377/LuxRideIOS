//
//  ReportListingViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 20/08/23.
//

import UIKit

class ReportListingViewController: UIViewController {

    @IBOutlet var btnReport: UIButton!
    @IBOutlet var viewReason: UIView!
    @IBOutlet var viewReasonList: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnReport.layer.cornerRadius = 10
        viewReason.layer.cornerRadius = 10
        viewReasonList.layer.cornerRadius = 10
        
        viewReasonList.layer.borderWidth = 1.0
        viewReasonList.layer.borderColor = UIColor.clear.cgColor
        
        viewReason.layer.borderWidth = 1.0
        viewReason.layer.borderColor = Constant.color.borderColor
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
