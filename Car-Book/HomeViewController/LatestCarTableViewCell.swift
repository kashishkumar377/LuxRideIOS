//
//  LatestCarTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class LatestCarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var carLatestCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "LatestCarCollectionViewCell", bundle: nil)
        carLatestCollectionView.register(nib, forCellWithReuseIdentifier: "recentViewCell")
        carLatestCollectionView.delegate = self
        carLatestCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension LatestCarTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 4
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentViewCell", for: indexPath)
         return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 350, height: 200)
        }
     
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
 }

