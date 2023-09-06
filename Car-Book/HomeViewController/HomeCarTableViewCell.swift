//
//  HomeCarTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class HomeCarTableViewCell: UITableViewCell {

    @IBOutlet weak var carCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: "CarCollectionViewCell", bundle: nil)
        carCollectionView.register(nib, forCellWithReuseIdentifier: "recentViewCell")
        carCollectionView.delegate = self
        carCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HomeCarTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 7
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentViewCell", for: indexPath)
         
         return cell
     }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 350, height: 250)
        }
 }
