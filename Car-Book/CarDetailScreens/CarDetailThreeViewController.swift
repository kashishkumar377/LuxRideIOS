//
//  CarDetailThreeViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 25/08/23.
//

import UIKit

class CarDetailThreeViewController: UIViewController {
    
    @IBOutlet var viewDiscountDay: UIView!
    @IBOutlet var viewDiscountPrice: UIView!
    @IBOutlet var viewAmtPerDay: UIView!
    @IBOutlet var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        viewDiscountDay.layer.cornerRadius = 10
        viewDiscountPrice.layer.cornerRadius = 10
        viewAmtPerDay.layer.cornerRadius = 10
        btnNext.layer.cornerRadius = 10
       
        viewDiscountDay.layer.borderWidth = 1.0
        viewDiscountDay.layer.borderColor =  Constant.color.borderColor
        
        viewDiscountPrice.layer.borderWidth = 1.0
        viewDiscountPrice.layer.borderColor =  Constant.color.borderColor
        
        viewAmtPerDay.layer.borderWidth = 1.0
        viewAmtPerDay.layer.borderColor =  Constant.color.borderColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onBtnNextClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.OwnerStoryboard.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailFourController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
