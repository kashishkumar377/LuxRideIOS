//
//  SettingsViewController+TableView.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import Foundation
import UIKit

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSettings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingSwitchCell") as! SettingsTableViewCell
            settingCell.lblSettings.text = arrSettings[indexPath.row]
            return settingCell
        }else {
            let settingCell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! SettingsTableViewCell
                settingCell.lblSettings.text = arrSettings[indexPath.row]
             return settingCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 6 {
            let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
            let targetVC = sb.instantiateViewController(withIdentifier: "ContactSupportViewController")
            self.navigationController?.pushViewController(targetVC, animated: true)
        }
        if indexPath.row == 1 {
            let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
            let targetVC = sb.instantiateViewController(withIdentifier: "AccountViewController")
            self.navigationController?.pushViewController(targetVC, animated: true)
        }
    }
    
}
