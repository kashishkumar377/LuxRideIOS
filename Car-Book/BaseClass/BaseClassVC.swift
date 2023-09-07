//
//  BaseClassVC.swift
//  VisaLo
//
//  Created by Caksu Sethi on 16/05/23.
//

import UIKit

class BaseClassVC: UIViewController {
    
    
    var reqUser = User.new()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func hideNavigate() {
        navigationController?.navigationBar.isHidden = true
    }
}
