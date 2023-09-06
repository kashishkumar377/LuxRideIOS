//
//  ProfileViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var viewData: UIView!
    @IBOutlet var btnTrip: UIButton!
    @IBOutlet var btnBecomeHost: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewData.layer.cornerRadius = 10
        btnTrip.layer.cornerRadius = 10
        btnBecomeHost.layer.cornerRadius = 10
    }
    
    @IBAction func onBtnSettingsClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "SettingsViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @IBAction func onBtnNotificationClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "NotificationViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @IBAction func onBtnBecomeHostClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "SignInSignUpViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

}
