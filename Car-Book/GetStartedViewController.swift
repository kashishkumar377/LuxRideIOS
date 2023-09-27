//
//  ViewController.swift
//  Car-Book
//
//  Created by Devgan on 14/08/23.
//

import UIKit

class GetStartedViewController: UIViewController {


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func onBtnGetStartedClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        UserStoreSingleton.shared.isLoggedIn = false
        let targetVC = sb.instantiateViewController(withIdentifier: "TabBarViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
  
}

