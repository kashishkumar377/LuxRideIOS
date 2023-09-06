//
//  carModelCollectionViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class carModelCollectionViewCell: UICollectionViewCell {
    @IBOutlet var btnModel: UIButton!
    @IBOutlet var imgModel: UIImageView!
    @IBOutlet var lblModel: UILabel!
    @IBOutlet var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBackground.layer.cornerRadius = 10
    }
}
