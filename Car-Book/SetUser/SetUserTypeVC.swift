//
//  SetUserTypeVC.swift
//  Car-Book
//
//  Created by Devgan on 15/09/23.
//

import UIKit
var UserType = false
class SetUserTypeVC: BaseClassVC {

  override func viewDidLoad() {
    super.viewDidLoad()

  }

}

extension SetUserTypeVC {
  @IBAction func btnSetUserType(_ sender:UIButton) {
    let targetVc : SignInSignUpViewController = Constant.AppStoryBoard.Main.instance.instantiateViewController()

    self.navigationController?.pushViewController(targetVc, animated: true)


  }
}
