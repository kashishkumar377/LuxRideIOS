//
//  AccountViewController+TableView.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import Foundation
import UIKit

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 180
        }else {
            return 105
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "paymentCell") as! accountTableViewCell
            return settingCell
        }else {
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "emailCell") as! accountTableViewCell
            settingCell.lblHeader.text = arrHeader[indexPath.row]
            settingCell.lblDetails.text = arrDetails[indexPath.row]
            return settingCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
            let targetVC = sb.instantiateViewController(withIdentifier: "ChangePasswordViewController")
            self.navigationController?.pushViewController(targetVC, animated: true)
        }
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
            let targetVC = sb.instantiateViewController(withIdentifier: "ChangeEmailViewController") as! ChangeEmailViewController
          targetVC.modalPresentationStyle = .overCurrentContext
             //add clear color background
          targetVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            self.present(targetVC, animated: true, completion: nil)
        }
    }
}
