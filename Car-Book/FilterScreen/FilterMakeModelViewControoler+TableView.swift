//
//  FilterMakeModelViewControoler+TableView.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 19/08/23.
//

import Foundation
import UIKit

extension FilterMakeModerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let makeCell = tableView.dequeueReusableCell(withIdentifier: "makeCell") as! HeaderTableViewCell
        makeCell.selectionStyle = .none
            if indexPath.row == 1 {
                makeCell.lblHeader.text = "AM General"
            }  else if indexPath.row == 2 {
                makeCell.lblHeader.text = "Acura"
            } else if indexPath.row == 3 {
                makeCell.lblHeader.text = "Audi"
            }
            return makeCell
    }
    
}
