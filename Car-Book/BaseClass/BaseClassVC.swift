//
//  BaseClassVC.swift
//  VisaLo
//
//  Created by Caksu Sethi on 16/05/23.
//

import UIKit
class BaseClassVC: UIViewController {
    
    // MARK: - Properties
    var reqUser = User.new()
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func hideNavigate() {
        navigationController?.navigationBar.isHidden = true
    }

}
