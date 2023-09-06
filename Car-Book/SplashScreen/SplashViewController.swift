//
//  SplashViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 16/08/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(getStarted), with: nil, afterDelay: 2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    @objc func getStarted() {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "GetStartedViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

}
