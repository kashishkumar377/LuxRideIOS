//
//  FilterViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 19/08/23.
//

import UIKit

class FilterViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var viewMake: UIView!
    @IBOutlet var viewModel: UIView!
    @IBOutlet var btnCar: UIButton!
    @IBOutlet var btnMiniVan: UIButton!
    @IBOutlet var btnTruck: UIButton!
    @IBOutlet var btnSuv: UIButton!
    @IBOutlet var btnVan: UIButton!
    @IBOutlet var btnClearAll: UIButton!
    @IBOutlet var btnApply: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnCar.layer.cornerRadius = 10
        btnMiniVan.layer.cornerRadius = 10
        btnTruck.layer.cornerRadius = 10
        btnSuv.layer.cornerRadius = 10
        btnVan.layer.cornerRadius = 10
        viewMake.layer.cornerRadius = 10
        viewModel.layer.cornerRadius = 10
        btnClearAll.layer.cornerRadius = 10
        btnApply.layer.cornerRadius = 10
        
        viewMake.layer.borderWidth = 1.0
        viewModel.layer.borderWidth = 1.0
       
        viewMake.layer.borderColor = UIColor.lightGray.cgColor
        viewModel.layer.borderColor = UIColor.lightGray.cgColor
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
            let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
            let targetVC = sb.instantiateViewController(withIdentifier: "FilterMakeModerViewController") as! FilterMakeModerViewController
            if textField.tag == 0 {
            targetVC.make = true
            }
            self.present(targetVC, animated: true, completion: nil)
    }
    
}
