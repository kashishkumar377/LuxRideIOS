//
//  HomeViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

protocol dismissFromSearch {
  func pass(data: String)
}

class HomeViewController: UIViewController,dismissFromSearch {
   
    @IBOutlet var tblCars: UITableView!
    @IBOutlet var viewLocation: UIView!
    @IBOutlet var imgLocation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imgLocation.layer.cornerRadius = 10
        registerNib()
    }
    
    func registerNib() {
        tblCars.register(UINib(nibName: "regulationsTableViewCell", bundle: nil), forCellReuseIdentifier: "regulationCell")
    }
    
    @objc func onBtnSearchClicked() {
    let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
    let targetVC = sb.instantiateViewController(withIdentifier: "FilterScreenPopUpViewController") as! FilterScreenPopUpViewController
    targetVC.delegate = self
    self.present(targetVC, animated: true, completion: nil)
    }
    
    @objc func onBtnFilterClicked() {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "FilterViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    @IBAction func onBtnChatClicked() {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "MessageVC")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }

    func pass(data: String) {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "searchListViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
}
