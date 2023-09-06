//
//  reviewTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 20/08/23.
//

import UIKit

class reviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviwCollectionView: UICollectionView!
    @IBOutlet weak var btnReport: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "reviewCollectionViewCell", bundle: nil)
        reviwCollectionView.register(nib, forCellWithReuseIdentifier: "reviewCell")
        reviwCollectionView.delegate = self
        reviwCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension reviewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewCell", for: indexPath)
         
         return cell
     }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 331, height: 133)
        }
 }
