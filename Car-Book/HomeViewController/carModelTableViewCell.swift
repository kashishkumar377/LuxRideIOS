//
//  carModelTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class carModelTableViewCell: UITableViewCell {

    @IBOutlet weak var carModelCollectionView: UICollectionView!
    @IBOutlet var viewNext: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        carModelCollectionView.delegate = self
        carModelCollectionView.dataSource = self
        viewNext.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension carModelTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carModelCell", for: indexPath) as! carModelCollectionViewCell
         if indexPath.row == 1 {
             cell.imgModel.image = (UIImage(named: "icon_Mercedes"))
         } 
         cell.btnModel.layer.cornerRadius = 10
         return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 110, height: 110)
        }
     
    
 }
