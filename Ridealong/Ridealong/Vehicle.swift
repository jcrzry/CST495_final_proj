//
//  Vehicle.swift
//  Ridealong
//
//  Created by SImon Nielsen on 26/09/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import UIKit
import Realm

class Vehicle: RLMObject {

    //Properties
    var numberOfSeats : Int?
    var numberOfSeatsAvailable : Int?
    var carBrand : String?
    var carModel : String?
}
