//
//  FilterScreenPopUpViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class FilterScreenPopUpViewController: UIViewController {

    @IBOutlet var viewMain: UIView!
    @IBOutlet var viewLocation: UIView!
    @IBOutlet var viewStartDate: UIView!
    @IBOutlet var viewEndDate: UIView!
    @IBOutlet var btnSearch: UIButton!
    var delegate: dismissFromSearch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMain.layer.cornerRadius = 10
        viewLocation.layer.cornerRadius = 10
        viewStartDate.layer.cornerRadius = 10
        viewEndDate.layer.cornerRadius = 10
        btnSearch.layer.cornerRadius = 10
        
        viewLocation.layer.borderWidth = 1.0
        viewStartDate.layer.borderWidth = 1.0
        viewEndDate.layer.borderWidth = 1.0
        
        viewLocation.layer.borderColor = UIColor.lightGray.cgColor
        viewStartDate.layer.borderColor = UIColor.lightGray.cgColor
        viewEndDate.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate.pass(data: "") 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onBtnSubmitClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    


}
