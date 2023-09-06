//
//  ReciverTableViewCell.swift
//  EasyJob
//
//  Created by Caksu Sethi on 21/08/23.
//

import UIKit

class ReciverTableViewCell: UITableViewCell {

    @IBOutlet weak var vw:UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vw.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
