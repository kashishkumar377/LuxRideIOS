//
//  carModelTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 18/08/23.
//

import UIKit
import Kingfisher
import SDWebImage

class carModelTableViewCell: UITableViewCell {

    @IBOutlet weak var carModelCollectionView: UICollectionView!
    @IBOutlet var viewNext: UIView!
    var carTypeArr = [CarTypeData]()
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
       return carTypeArr.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carModelCell", for: indexPath) as! carModelCollectionViewCell
         cell.lblModel.text = carTypeArr[indexPath.row].companyName
       
       let imgUrl = "\(APiConstants.imageUrl)\(carTypeArr[indexPath.row].companyImg ?? "")"
       let trimurl = imgUrl.replacingOccurrences(of: " ", with: "%20")
       cell.imgModel.sd_imageIndicator = SDWebImageActivityIndicator.gray
       cell.imgModel.sd_setImage(with: URL(string: trimurl), placeholderImage: UIImage(named: ""))
       cell.btnModel.layer.cornerRadius = 10
       return cell
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 110, height: 110)
      }
     }

extension UIImage {
  convenience init?(url: URL?) {
    guard let url = url else { return nil }

    do {
      self.init(data: try Data(contentsOf: url))
    } catch {
      print("Cannot load image from url: \(url) with error: \(error)")
      return nil
    }
  }
}
