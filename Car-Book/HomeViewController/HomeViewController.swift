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

class HomeViewController: BaseClassVC,dismissFromSearch {
   
    @IBOutlet var tblCars: UITableView!
    @IBOutlet var viewLocation: UIView!
    @IBOutlet var imgLocation: UIImageView!

     var carTypeArr = [CarTypeData]()
     var carNameArr = [CarTypeData]()
     override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        registerNib()
        self.getCarType()
        self.getCarName()
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

//MARK: -  -----API CALLS-----
extension HomeViewController {

  func getCarType(){
      reqUser.getCarTypeAPi { user, res, errCode in

        DispatchQueue.main.async {
          self.carTypeArr = user ?? [CarTypeData]()
          self.tblCars.reloadData()
        }
     }
  }

  func getCarName(){
      reqUser.getCarCompaniesApi { user, res, errCode in

        DispatchQueue.main.async {
          self.carNameArr = user ?? [CarTypeData]()
          self.tblCars.reloadData()
        }
     }
  }
}
