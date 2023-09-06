//
//  SettingsTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet var imgSettings: UIImageView!
    @IBOutlet var lblSettings: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
