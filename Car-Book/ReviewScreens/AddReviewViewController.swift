//
//  AddReviewViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class AddReviewViewController: UIViewController {

    @IBOutlet var viewAddReview: UIView!
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var btnReview1: UIButton!
    @IBOutlet var btnReview2: UIButton!
    @IBOutlet var btnReview3: UIButton!
    @IBOutlet var btnReview4: UIButton!
    @IBOutlet var btnReview5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewAddReview.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10
       
        viewAddReview.layer.borderWidth = 1.0
        viewAddReview.layer.borderColor =  Constant.color.borderColor
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
