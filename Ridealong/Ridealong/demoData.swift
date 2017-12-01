//
//  demoData.swift
//  Ridealong
//
//  Created by Jonas Deichelmann on 16.11.17.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation
import UIKit
import TB

let demoDriver1 = driverData(
    id: "D1",
    image: nil,
    imageId: "I1",
    firstName: "Ryan",
    lastName: "Cruz",
    displayName: "Ryan Cruz",
    rideID: ["r1"]
)

let demoDriver2 = driverData(
    id: "D2",
    image: nil,
    imageId: "I2",
    firstName: "Alfonso",
    lastName: "Torres",
    displayName: "Alfonso Torres",
    rideID: ["r2"]
)
let demoSeats1 = seatData(
    driversSeat: .reserved,
    shotGunSeat: .open,
    leftSeat: .open,
    middleSeat: .open,
    rightSeat: .open,
    leftBackSeat: .unavailable,
    rightBackSeat: .unavailable
)
var demoDrivers = [demoDriver1, demoDriver2]
let demoRide1 = rideData(
    rideDate: Date().add(minutes: 30),
    id: "r1",
    from: "CSUMB",
    to: "San Francisco",
    notes: "Hey, I want to meet new cool people",
    seats: demoSeats1
)
let demoRide2 = rideData(
    rideDate: Date().add(minutes: 60),
    id: "r2",
    from: "CSUMB",
    to: "Monterey",
    notes: "Hey, I want to hear cool music during the ride",
    seats: demoSeats1
)
let demoRides = [demoRide1, demoRide2]

func search(name: String) -> driverData? {
    for driver in demoDrivers {
        if name == driver.firstName || name == driver.lastName {
            return driver
        }
    }
    return nil
}
