//
//  FavoriteCarViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class FavoriteCarViewController: UIViewController {

    @IBOutlet var tblFavCar: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  @IBAction func onBtnBackClicked(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }

}
