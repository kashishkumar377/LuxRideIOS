//
//  SearchTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {


    @IBOutlet var btnSearch: UIButton!
    @IBOutlet var viewSearch: UIView!

    @IBOutlet weak var carCollectionView: UICollectionView!

    var carTypeArr = [CarTypeData]()
    override func awakeFromNib() {
        super.awakeFromNib()

     // carCollectionView.delegate = self
    //  carCollectionView.dataSource = self

        // Initialization code
        viewSearch.layer.cornerRadius = 10
      //  btnView.layer.cornerRadius = 10

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return carTypeArr.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carType", for: indexPath) as! carTypeCell
     cell.lblCar.text = carTypeArr[indexPath.row].vehicleTypeName
      // cell.btnModel.layer.cornerRadius = 10
       return cell
   }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 110, height: 110)
      }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 5
      }

}

