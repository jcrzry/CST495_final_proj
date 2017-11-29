//
//  SeeRideViewController.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 28.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import TB
import UIKit

class SeeRideViewController: UIViewController {
    @IBOutlet var driversSeat: UIButton!
    @IBOutlet var shotGunSeat: UIButton!
    @IBOutlet var leftSeat: UIButton!
    @IBOutlet var middleSeat: UIButton!
    @IBOutlet var rightSeat: UIButton!
    @IBOutlet var doneButton: UIButton!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @IBAction func doneButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func shotGunSeat(_ sender: Any) {
        TB.temp("shotGunSeat presed")
        self.shotGunSeat.backgroundColor = UIColor.blue
    }
    @IBAction func middleSeat(_ sender: Any) {
        TB.temp("middleSeat presed")
    }
    @IBAction func rightSeat(_ sender: Any) {
        TB.temp("rightSeat presed")
    }
    @IBAction func leftSeat(_ sender: Any) {
        TB.temp("leftleftSeat presed")
    }
}
