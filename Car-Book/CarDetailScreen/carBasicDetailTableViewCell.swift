//
//  carBasicDetailTableViewCell.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 19/08/23.
//

import UIKit

class carBasicDetailTableViewCell: UITableViewCell {

    @IBOutlet var viewEngine: UIView!
    @IBOutlet var viewFuelType: UIView!
    @IBOutlet var viewTransmission: UIView!
    @IBOutlet weak var carSliderCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewFuelType.layer.cornerRadius = 10
        viewEngine.layer.cornerRadius = 10
        viewTransmission.layer.cornerRadius = 10
        
        
        viewEngine.layer.borderWidth = 1.0
        viewFuelType.layer.borderWidth = 1.0
        viewTransmission.layer.borderWidth = 1.0
        
        viewEngine.layer.borderColor = UIColor(red:199/255, green:199/255, blue:199/255, alpha: 1).cgColor
        viewFuelType.layer.borderColor = UIColor(red:199/255, green:199/255, blue:199/255, alpha: 1).cgColor
        viewTransmission.layer.borderColor = UIColor(red:199/255, green:199/255, blue:199/255, alpha: 1).cgColor
        
        let nib = UINib(nibName: "carSliderCollectionViewCell", bundle: nil)
        carSliderCollectionView.register(nib, forCellWithReuseIdentifier: "carSliderCell")
        carSliderCollectionView.delegate = self
        carSliderCollectionView.dataSource = self
        startTimer()
    }
    
    func startTimer() {
        let timer =  Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }


    @objc func scrollAutomatically(_ timer1: Timer) {
        if let coll  = carSliderCollectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)! < carSliderCollectionView.numberOfItems(inSection: 0) - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension carBasicDetailTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 3
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carSliderCell", for: indexPath)
         
         return cell
     }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 160)
        }
 }
