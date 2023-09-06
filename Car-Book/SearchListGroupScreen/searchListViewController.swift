//
//  searchListViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 23/08/23.
//

import UIKit

class searchListViewController: UIViewController {

    @IBOutlet var tblSearchCar: UITableView!
    @IBOutlet var viewSearch: UIView!
    @IBOutlet var viewMap: UIView!
    @IBOutlet var viewDate: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSearch.layer.cornerRadius = 10
        viewMap.layer.cornerRadius = 10
        viewDate.layer.cornerRadius = 10
    }
    
    @IBAction func onBtnFilterClicked() {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "FilterViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @IBAction func onBtnLocationClicked() {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "LocationViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
