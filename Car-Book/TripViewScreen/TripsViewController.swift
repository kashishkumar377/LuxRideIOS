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

    }

  @IBAction func actionHistory(_ sender: UIButton) {
   
   }
}
