//
//  CarDetailFourController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class CarDetailFourController: UIViewController {
    
    @IBOutlet var viewDesc: UIView!
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var img_car1: UIImageView!
    @IBOutlet var img_car2: UIImageView!
    @IBOutlet var img_car3: UIImageView!
    @IBOutlet var img_car4: UIImageView!
    @IBOutlet var img_car5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewDesc.layer.cornerRadius = 10
        btnSubmit.layer.cornerRadius = 10
        img_car1.layer.cornerRadius = 10
        img_car2.layer.cornerRadius = 10
        img_car3.layer.cornerRadius = 10
        img_car4.layer.cornerRadius = 10
        img_car5.layer.cornerRadius = 10
       
        viewDesc.layer.borderWidth = 1.0
        viewDesc.layer.borderColor =  Constant.color.borderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
