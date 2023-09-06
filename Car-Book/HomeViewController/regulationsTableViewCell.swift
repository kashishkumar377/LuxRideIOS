//
//  regulationsTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 23/08/23.
//

import UIKit

class regulationsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgHeader: UIImageView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnDrive: UIButton!
    @IBOutlet weak var viewLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
