//
//  SearchTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var btnView: UIButton!
    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var viewSearch: UIView!
    @IBOutlet var viewLuxry: UIView!
    @IBOutlet var viewExecutive: UIView!
    @IBOutlet var viewUtility: UIView!
    @IBOutlet var viewBoat: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewSearch.layer.cornerRadius = 10
        btnView.layer.cornerRadius = 10
        viewLuxry.layer.cornerRadius = 15
        viewExecutive.layer.cornerRadius = 15
        viewUtility.layer.cornerRadius = 15
        viewBoat.layer.cornerRadius = 15
        
        viewLuxry.layer.shadowOpacity = 1
        viewLuxry.layer.shadowOffset = .zero
        viewLuxry.layer.shadowRadius = 0.5
        
        viewExecutive.layer.shadowOpacity = 1
        viewExecutive.layer.shadowOffset = .zero
        viewExecutive.layer.shadowRadius = 0.5
        
        viewUtility.layer.shadowOpacity = 1
        viewUtility.layer.shadowOffset = .zero
        viewUtility.layer.shadowRadius = 0.5
        
        viewBoat.layer.shadowOpacity = 1
        viewBoat.layer.shadowOffset = .zero
        viewBoat.layer.shadowRadius = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
