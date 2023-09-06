//
//  CarDetailViewController+Tableview.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 20/08/23.
//

import Foundation
import UIKit

extension CarDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let carDetailCell = tableView.dequeueReusableCell(withIdentifier: "carDetailCell") as! carBasicDetailTableViewCell
            return carDetailCell
        } else if indexPath.row == 1{
            let tripDateCell = tableView.dequeueReusableCell(withIdentifier: "tripDiscount") as! tripDiscountTableViewCell
            return tripDateCell
        }
        else if indexPath.row == 2{
            let tripDateCell = tableView.dequeueReusableCell(withIdentifier: "cancellationCell") as! cancellationTableViewCell
            return tripDateCell
        }
        else if indexPath.row == 3{
            let tripDateCell = tableView.dequeueReusableCell(withIdentifier: "pickDropCell") as! pickDropTableViewCell
            return tripDateCell
        }
        else if indexPath.row == 4{
            let tripDateCell = tableView.dequeueReusableCell(withIdentifier: "insuranceCell") as! insuranceTableViewCell
            return tripDateCell
        }
        else if indexPath.row == 5{
            let tripDateCell = tableView.dequeueReusableCell(withIdentifier: "ownerCell") as! ownerInfoTableViewCell
            return tripDateCell
        }
        else {
            let tripDateCell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! reviewTableViewCell
            tripDateCell.btnReport.addTarget(self, action: #selector(self.onBtnReportClicked), for: .touchUpInside)
            return tripDateCell
        }
    }
    
}
