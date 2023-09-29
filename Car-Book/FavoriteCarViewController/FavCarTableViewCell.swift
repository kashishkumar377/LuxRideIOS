//
//  FavCarTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class FavCarTableViewCell: UITableViewCell {

    @IBOutlet var viewBackground: UIView!
    @IBOutlet var imgCar: UIImageView!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var imgAction: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        viewBackground.layer.cornerRadius = 10.0
//        viewBackground.layer.borderWidth = 0.5
//        viewBackground.layer.borderColor = UIColor.clear.cgColor
        //imgCar.layer.cornerRadius = 10.0
       
        let attrStri = NSMutableAttributedString.init(string:"₦400,000/day")
        let nsRange = NSString(string: "₦400,000/day")
                .range(of: "₦400,000", options: String.CompareOptions.caseInsensitive)
        attrStri.addAttributes([
            NSAttributedString.Key.foregroundColor : Constant.color.priceColor,
            NSAttributedString.Key.font: UIFont.init(name: "Montserrat-Bold", size: 10.0) as Any
        ], range: nsRange)
       // lblPrice.attributedText = attrStri
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
