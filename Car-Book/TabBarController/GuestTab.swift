//
//  GuestTab.swift
//  Car-Book
//
//  Created by Devgan on 20/09/23.
//

import UIKit

class GuestTab: UITabBarController,UITabBarControllerDelegate {

  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
    

  }

  override func viewWillAppear(_ animated: Bool) {
      self.navigationController?.navigationBar.isHidden = true
  }

}
