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

    //    MARK: Variables
    @IBOutlet var driversSeat: UIButton!
    @IBOutlet var shotGunSeat: UIButton!
    @IBOutlet var leftSeat: UIButton!
    @IBOutlet var middleSeat: UIButton!
    @IBOutlet var rightSeat: UIButton!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet weak var driversName: UILabel!
    @IBOutlet weak var startLocaton: UILabel!
    @IBOutlet weak var destinationLocation: UILabel!
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var rideDate: UILabel!
//    var isShotGunSeatSelected: Bool!
//    var isShotGunSeatSelectedPermanently: Bool!
//    var isLeftSeatSelected: Bool!
//    var isLeftSeatSelectedPermanently: Bool!
//    var isMiddleSeatSelected: Bool!
//    var isMiddleSeatSelectedPermanently: Bool!
//    var isRightSeatSelected: Bool!
//    var isRightSeatSelectedPermanently: Bool!
    private var driver: driverData?
    private var ride: rideData?
    private var seats: seatData?


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        driversName.text = driver?.displayName
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    // MARK: Setup
    func setData(ride: rideData) {
        self.ride = ride
        setUpSeats(seats: ride.seats)
        startLocaton?.text = ride.from
        destinationLocation?.text = ride.to
        notes?.text = ride.notes
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US")
        rideDate?.text = dateFormatter.string(from: (ride.rideDate))
        self.driver = rideForDriver(ride: ride)
    }
    func setUpSeats(seats: seatData){

    }
    func rideForDriver(ride: rideData) -> driverData {
        var driver = driverData()
        for ride in demoRides {
            for eachDriver in demoDrivers {
                for eachRide in eachDriver.rideID{
                    if ride.id == eachRide{
                        driver = eachDriver
                        break
                    }
                }
            }
        }
        return driver
    }
    @IBAction func doneButton(_ sender: Any) {
        joinFunction()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func shotGunSeat(_ sender: Any) {
        TB.temp("shotGunSeat presed")
        self.shotGunSeat.backgroundColor = UIColor.blue
    }
    @IBAction func middleSeat(_ sender: Any) {
        TB.temp("middleSeat presed")
        self.middleSeat.backgroundColor = UIColor.blue
    }
    @IBAction func rightSeat(_ sender: Any) {
        TB.temp("rightSeat presed")
        self.rightSeat.backgroundColor = UIColor.blue
    }
    @IBAction func leftSeat(_ sender: Any) {
        TB.temp("leftleftSeat presed")
        self.leftSeat.backgroundColor = UIColor.blue
    }
    func joinFunction(){
        TB.info("User wants to join the ride")
    }
}
