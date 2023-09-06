//
//  CarDetailViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 20/08/23.
//

import UIKit

class CarDetailViewController: UIViewController {

    @IBOutlet var btnBook: UIButton!
    @IBOutlet var tblCarDetail: UITableView!
    @IBOutlet var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBook.layer.cornerRadius = 10
        let nib = UINib(nibName: "carBasicDetailTableViewCell", bundle: nil)
        tblCarDetail.register(nib, forCellReuseIdentifier: "carDetailCell")
        tblCarDetail.dataSource = self
        showPrice()
    }
    
    func showPrice() {
        let attrStri = NSMutableAttributedString.init(string:"₦400,000/day")
        let nsRange = NSString(string: "₦400,000/day")
                .range(of: "₦400,000", options: String.CompareOptions.caseInsensitive)
        attrStri.addAttributes([
            NSAttributedString.Key.foregroundColor : Constant.color.priceColor,
            NSAttributedString.Key.font: UIFont.init(name: "Montserrat-Bold", size: 10.0) as Any
        ], range: nsRange)
        lblPrice.attributedText = attrStri
    }
    
    @objc func onBtnReportClicked() {
        let sb = UIStoryboard(name: Constant.AppStoryBoard.Main.rawValue, bundle: nil)
        let targetVC = sb.instantiateViewController(withIdentifier: "ReportListingViewController")
        self.present(targetVC, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func onBtnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
