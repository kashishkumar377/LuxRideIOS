//
//  CarCollectionViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 17/08/23.
//

import UIKit

class CarCollectionViewCell: UICollectionViewCell {

    @IBOutlet var viewBackground: UIView!
    @IBOutlet var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackground.layer.cornerRadius = 10.0
        let attrStri = NSMutableAttributedString.init(string:"₦400,000/day")
        let nsRange = NSString(string: "₦400,000/day")
                .range(of: "₦400,000", options: String.CompareOptions.caseInsensitive)
        attrStri.addAttributes([
            NSAttributedString.Key.foregroundColor : Constant.color.priceColor,
            NSAttributedString.Key.font: UIFont.init(name: "Montserrat-Bold", size: 10.0) as Any
        ], range: nsRange)
        lblPrice.attributedText = attrStri
    }

}
