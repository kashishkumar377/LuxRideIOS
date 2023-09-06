//
//  reviewCollectionViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 20/08/23.
//

import UIKit

class reviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet var viewReview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewReview.layer.cornerRadius = 10
        viewReview.layer.borderWidth = 1.0
        viewReview.layer.borderColor = UIColor.clear.cgColor
    }

}
