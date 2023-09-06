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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnTrip.layer.cornerRadius = 10
        btnHistory.layer.cornerRadius = 10
    }

}
