//
//  searchListViewController+Tableview.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 23/08/23.
//

import Foundation
import UIKit

extension searchListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favCarCell = tableView.dequeueReusableCell(withIdentifier: "favCarCell") as! FavCarTableViewCell
        if (indexPath.row % 2 != 0){
           // favCarCell.imgCar.image = UIImage(named: "img_hector")
        }
        return favCarCell
    }
    
}
