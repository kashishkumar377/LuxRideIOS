//
//  FilterMakeModerViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 19/08/23.
//

import UIKit

class FilterMakeModerViewController: UIViewController {
  
    @IBOutlet var viewMain: UIView!
    var make : Bool = false
    @IBOutlet var lblHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         viewMain.layer.cornerRadius = 10
        if !make {
            lblHeader.text = "Model"
        }
    }

}
