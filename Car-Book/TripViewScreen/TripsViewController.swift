//
//  TripsViewController.swift
//  Car-Book
//
//  Created by TSharmaFlynas on 24/08/23.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet var tblTrips: UITableView!
    @IBOutlet var btnTrip: UIButton!
    @IBOutlet var btnHistory: UIButton!
    @IBOutlet weak var lblnoTrip: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        lblnoTrip.font = UIFont(name: "Poppins-Medium", size: 20)
      let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
      segment.setTitleTextAttributes(titleTextAttributes, for: .selected)
      let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.black]
      segment.setTitleTextAttributes(titleTextAttributes1, for: .normal)
      let font1 = [NSAttributedString.Key.font: UIFont(name: "Poppins-Medium", size: 18.0 )]
      segment.setTitleTextAttributes(font1, for: .normal)
    }

  @IBAction func segmentControl(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
      lblnoTrip.text = "No Trips"
    } else if sender.selectedSegmentIndex == 1{
      lblnoTrip.text = "No History"
    }
  }

  @IBAction func actionBooked(_ sender: UIButton) {
//    sender.isSelected = !sender.isSelected
    if btnTrip.backgroundColor == .black {
      btnHistory.backgroundColor = .white
      btnHistory.setTitleColor(UIColor(red: 238/285, green: 238/285, blue: 238/285), for: .normal)
    } else {
      btnTrip.backgroundColor = .black

//        backgroundColor = UIColor(red: 238/285, green: 238/285, blue: 238/285)
//      setTitleColor(UIColor.black, for: .normal)
    }
//      if sender.isSelected{
//        sender.backgroundColor = UIColor.black
//        sender.setTitleColor(UIColor(red: 238/285, green: 238/285, blue: 238/285), for: .normal)
//         }
//      else{
//        sender.backgroundColor = UIColor(red: 238/285, green: 238/285, blue: 238/285)
//        sender.setTitleColor(UIColor.black, for: .normal)
//       }
    }

  @IBAction func actionHistory(_ sender: UIButton) {
    lblnoTrip.font = UIFont(name: "Poppins-Medium", size: 20)
    lblnoTrip.text = "No History"
//    sender.isSelected = !sender.isSelected
      if sender.isSelected{
        sender.backgroundColor = UIColor.black
        sender.setTitleColor(UIColor(red: 238/285, green: 238/285, blue: 238/285), for: .normal)
         }
      else{
        sender.backgroundColor = UIColor(red: 238/285, green: 238/285, blue: 238/285)
        sender.setTitleColor(UIColor.black, for: .normal)
       }
   }
}
