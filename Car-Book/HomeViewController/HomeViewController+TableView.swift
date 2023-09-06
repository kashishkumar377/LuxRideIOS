//
//  HomeViewController+TableView.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 500
        }
       else if indexPath.row == 3 || indexPath.row == 4 {
            return 100
        }
        else if indexPath.row == 5 {
            return 150
        }
        else if indexPath.row == 2 {
            return 250
        }
       else if indexPath.row == 6 || indexPath.row == 1{
            return 60
        }else if indexPath.row == 8{
            return 250
        }
        else {
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let searachCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchTableViewCell
            searachCell.selectionStyle = .none
            searachCell.btnSearch.addTarget(self, action: #selector(self.onBtnSearchClicked), for: .touchUpInside)
            return searachCell
        }
        else if indexPath.row == 1 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
            headerCell.selectionStyle = .none
            return headerCell
        }
        else if indexPath.row == 2 {
            let carModelCell = tableView.dequeueReusableCell(withIdentifier: "carCell") as! HomeCarTableViewCell
            carModelCell.selectionStyle = .none
            return carModelCell
        }
        else if indexPath.row == 3 {
            let regulationCell = tableView.dequeueReusableCell(withIdentifier: "regulationCell") as! regulationsTableViewCell
            regulationCell.selectionStyle = .none
            regulationCell.imgHeader.image = UIImage(named: "icon_emergency")
            return regulationCell
        }
        else if indexPath.row == 4 {
            let regulationCell = tableView.dequeueReusableCell(withIdentifier: "regulationCell") as! regulationsTableViewCell
            regulationCell.lblHeader.text = "Follow Local Laws"
            regulationCell.lblDescription.text = "Obey all traffic laws, speed limits, and road signs. Research local driving regulations if you're in a foreign country."
            regulationCell.imgHeader.image = UIImage(named: "icon_.rule")
            regulationCell.selectionStyle = .none
            return regulationCell
        }
        else if indexPath.row == 5 {
            let regulationCell = tableView.dequeueReusableCell(withIdentifier: "regulationCell") as! regulationsTableViewCell
            regulationCell.selectionStyle = .none
            regulationCell.lblHeader.text = "Road Condition"
            regulationCell.lblDescription.text = "Be cautious on unfamiliar roads, and watch for hazards like potholes and road signs."
            regulationCell.imgHeader.image = UIImage(named: "icon_.rule")
            regulationCell.viewLine.isHidden = false
            return regulationCell
        }
        else if indexPath.row == 6 {
            let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderTableViewCell
            headerCell.lblHeader.text = "Browse by Brand"
            headerCell.selectionStyle = .none
            return headerCell
        } else if indexPath.row == 7 {
            let carModelCell = tableView.dequeueReusableCell(withIdentifier: "carModelCell") as! carModelTableViewCell
            carModelCell.selectionStyle = .none
            return carModelCell
        }else {
                let regulationCell = tableView.dequeueReusableCell(withIdentifier: "carDriveCell") as! regulationsTableViewCell
                regulationCell.selectionStyle = .none
                regulationCell.imgHeader.layer.cornerRadius = 10
                regulationCell.btnDrive.layer.cornerRadius = 10
                return regulationCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "CarDetailViewController")
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
}
